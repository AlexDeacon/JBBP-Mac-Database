class ComputersController < ApplicationController
  helper_method :sort_column, :sort_direction

  # GET /computers
  # GET /computers.json
  def index
    if  !params[:filter].nil? && params[:filter] != "All"
      @filtered_computers = Computer.where("computer_status = ?", params[:filter])
      @computers = @filtered_computers.order(sort_column + ' ' + sort_direction)
    else
      @computers = Computer.order(sort_column + ' ' + sort_direction)
    end

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

    respond_to do |format|      format.html { redirect_to computers_url }
      format.json { head :ok }
    end
  end

  private

  def sort_column  
    Computer.column_names.include?(params[:sort]) ? params[:sort] : "computer_name_en"  
  end  
    
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end 

end
