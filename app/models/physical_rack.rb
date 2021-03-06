class PhysicalRack
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning
  max_versions 5

  field :index, :type => Integer
  field :name, :type => String
  field :number_of_us, :type => Integer

  has_many :physical_hosts
  belongs_to :datacenter
  has_many :audits, :as => :entity

  index :name, unique: true
  index :index

  validates_numericality_of :number_of_us, :only_integer => true, :allow_blank => true
  validates_numericality_of :index, :only_integer => true
  validates_presence_of :name
  validates_associated :datacenter
  
  def self.list_options
    PhysicalRack.all.map {|r| [r.id, r.name]}
  end

  def to_param
    (name.gsub('.', '-') if name) || id.to_s
  end

  # This adds a list of empty hosts to the rack where the rack has gaps in the U's list
  def add_missing_hosts
    all_us = physical_hosts.asc(:u).map(&:u)
    last_u = all_us.last
    if last_u
      (1..last_u).each do |u_index|
        if not all_us.include?(u_index)
          host = PhysicalHost.new(name: "", n: 0, u: u_index)
          self.physical_hosts << host
        end
      end
      save!
    end
  end

  # Updats this rack from the given row (updates one specific host)
  def update_host_from_csv(row)
    i = 0
    host_id =             row[i]
    host_u =              row[i += 1]
    host_n =              row[i += 1]
    host_ob_name =        row[i += 1]
    host_name =           row[i += 1]
    parent_host_name =    row[i += 1]
    pdu1_name =           row[i += 1]
    pdu1_voltage =        row[i += 1]
    pdu1_amps =           row[i += 1]
    pdu2_name =           row[i += 1]
    pdu2_voltage =        row[i += 1]
    pdu2_amps =           row[i += 1]

    host = host_id.nil? ? PhysicalHost.new : PhysicalHost.find(host_id)
    physical_hosts << host unless physical_hosts.include?(host)
    host.u = host_u
    host.n = host_n
    host.ob_name = host_ob_name
    host.name = host_name

    if parent_host_name
      parent_host = PhysicalHost.find_by_name(parent_host_name)
      if not parent_host.child_hosts.include?(host)
        parent_host.child_hosts << host
      end
    else
      host.parent_host = nil
    end

    host.update_pdu(pdu1_name, pdu1_voltage, pdu1_amps)
    host.update_pdu(pdu2_name, pdu2_voltage, pdu2_amps)
    host.remove_non_existing_pdus([pdu1_name, pdu2_name])

    is_new = host.new?
    changed = host.changed? and not is_new
    success = host.save

    {updates: changed ? 1 : 0, insertions: is_new ? 1 : 0, errors: success ? 0 : 1}
  end


end
