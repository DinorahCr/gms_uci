module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  
  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<<  " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + "  >>"    
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options /events/#{event.id}
    calendar event_calendar_opts do |args|
          event, day= args[:event], args[:day]
          %(<a href="/events/#{event.id}" title="#{h(event.title)}">
          #{h(event.title)} 
          #{(display_event_time(event,day))} </a>)
          
          
          
    end     
  end
   
   def display_event_time(event, day)
      start = event.start_at
      finish = event.end_at
      if !event.all_day and start.to_date == day
        t = I18n.localize(start, :format => "%l:%M%p")
        e = I18n.localize(finish, :format => "%l:%M%p")
        %(<span class="ec-event-time">#{t} - #{e}</span>)
      else
        ""
      end
    end
   
end