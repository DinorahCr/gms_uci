class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:index, :show] 
  respond_to :html, :js
  #layout :admin_layout 
  
  # GET /events
  # GET /events.json
  def index
    @events = Event.order('date DESC').all
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
     @event = Event.new(event_params)
   
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
   
    # Never trust parameters from the scary internet, only allow the white list through. :activity_id,
    
    def event_params
      params.require(:event).permit(:title, :date, :times, :start_at, :end_at, :body)
    end
    
    def authenticate 
        authenticate_or_request_with_http_basic do |name, password|
          name = "admin" && password = "secret"
        end
      end
    
    #def admin_layout 
      #"admin"
    #end 
    
end
