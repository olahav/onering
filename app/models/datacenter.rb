class Datacenter
  include Mongoid::Document

  field :name, :type => String
  field :provider_name, :type => String
  field :location, :type => String
  field :contact_info, :type => String
  field :support_link, :type => String
  field :support_email, :type => String
  field :support_phone, :type => String
  

  has_many :physical_racks

  validates_presence_of :name
    
  def self.list_options
    Datacenter.all.map {|r| [r.id, r.name]}
  end

end
