class BatteriesController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /batteries
  # GET /batteries.json
  def index
#    @filtered_batteries = Battery.where("battery_status = ?", params[:filter])
#    @batteries = @filtered_batteries.order(sort_column + ' ' + sort_direction)
    @batteries = Battery.order(sort_column + ' ' + sort_direction)



    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @batteries }
    end
  end

  # GET /batteries/1
  # GET /batteries/1.json
  def show
    @battery = Battery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @battery }
    end
  end

  # GET /batteries/new
  # GET /batteries/new.json
  def new
    @battery = Battery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @battery }
    end
  end

  # GET /batteries/1/edit
  def edit
    @battery = Battery.find(params[:id])
  end

  # POST /batteries
  # POST /batteries.json
  def create
    @battery = Battery.new(params[:battery])

    respond_to do |format|
      if @battery.save
        format.html { redirect_to @battery, :notice => 'Battery was successfully created.' }
        format.json { render :json => @battery, :status => :created, :location => @battery }
      else
        format.html { render :action => "new" }
        format.json { render :json => @battery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /batteries/1
  # PUT /batteries/1.json
  def update
    @battery = Battery.find(params[:id])

    respond_to do |format|
      if @battery.update_attributes(params[:battery])
        format.html { redirect_to @battery, :notice => 'Battery was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @battery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /batteries/1
  # DELETE /batteries/1.json
  def destroy
    @battery = Battery.find(params[:id])
    @battery.destroy

    respond_to do |format|
      format.html { redirect_to batteries_url }
      format.json { head :ok }
    end
  end

  private

  def sort_column  
    Battery.column_names.include?(params[:sort]) ? params[:sort] : "battery_jbbp_id"  
  end  
    
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"   

  end 


end

