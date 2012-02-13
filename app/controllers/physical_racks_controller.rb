class PhysicalRacksController < ApplicationController
  # GET /physical_racks
  # GET /physical_racks.json
  def index
    @physical_racks = PhysicalRack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @physical_racks }
    end
  end

  # GET /physical_racks/1
  # GET /physical_racks/1.json
  def show
    @physical_rack = PhysicalRack.find(params[:id])
    @new_physical_host = PhysicalHost.new(:physical_rack => @physical_rack)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @physical_rack }
    end
  end

  # GET /physical_racks/new
  # GET /physical_racks/new.json
  def new
    @physical_rack = PhysicalRack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @physical_rack }
    end
  end

  # GET /physical_racks/1/edit
  def edit
    @physical_rack = PhysicalRack.find(params[:id])
  end

  # POST /physical_racks
  # POST /physical_racks.json
  def create
    @physical_rack = PhysicalRack.new(params[:physical_rack])

    respond_to do |format|
      if @physical_rack.save
        format.html { redirect_to @physical_rack, notice: 'Physical rack was successfully created.' }
        format.json { render json: @physical_rack, status: :created, location: @physical_rack }
      else
        format.html { render action: "new" }
        format.json { render json: @physical_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /physical_racks/1
  # PUT /physical_racks/1.json
  def update
    @physical_rack = PhysicalRack.find(params[:id])

    respond_to do |format|
      if @physical_rack.update_attributes(params[:physical_rack])
        format.html { redirect_to @physical_rack, notice: 'Physical rack was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @physical_rack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_racks/1
  # DELETE /physical_racks/1.json
  def destroy
    @physical_rack = PhysicalRack.find(params[:id])
    @physical_rack.destroy

    respond_to do |format|
      format.html { redirect_to physical_racks_url }
      format.json { head :ok }
    end
  end
end
