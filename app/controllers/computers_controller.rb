class ComputersController < ApplicationController
  # GET /computers
  # GET /computers.json
  def index
    @computers = Computer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @computers }
    end
  end

  # GET /computers/1
  # GET /computers/1.json
  def show
    @computer = Computer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @computer }
    end
  end

  # GET /computers/new
  # GET /computers/new.json
  def new
    @computer = Computer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @computer }
    end
  end

  # GET /computers/1/edit
  def edit
    @computer = Computer.find(params[:id])
  end

  # POST /computers
  # POST /computers.json
  def create
    @computer = Computer.new(params[:computer])

    respond_to do |format|
      if @computer.save
        format.html { redirect_to @computer, :notice => 'Computer was successfully created.' }
        format.json { render :json => @computer, :status => :created, :location => @computer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @computer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /computers/1
  # PUT /computers/1.json
  def update
    @computer = Computer.find(params[:id])

    respond_to do |format|
      if @computer.update_attributes(params[:computer])
        format.html { redirect_to @computer, :notice => 'Computer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @computer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    @computer = Computer.find(params[:id])
    @computer.destroy

    respond_to do |format|
      format.html { redirect_to computers_url }
      format.json { head :ok }
    end
  end
end
