class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  
  # GET /events
  # GET /events.json
  def index
    @events = Event.all(:order => "created_at DESC")
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if @event.nil?
        redirect_to action: :index
      end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.create(event_params)
    respond_to do |format|
          if @event.save
              format.html 
              format.js
              
          else
            format.html { render :action => "new" }
            format.js
          end
        end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
      @event.update(event_params)  
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :body)
    end
    
    
end
