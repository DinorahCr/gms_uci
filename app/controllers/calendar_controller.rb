class CalendarController < ApplicationController
  
  def index
   
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    
    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
    #For the given month, find the start+end dates. Find all the activities within this range, and create event strips for thems
  end
  
end
