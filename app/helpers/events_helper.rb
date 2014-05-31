module EventsHelper
 
  def format_date(time)
    d = I18n.localize(time, :format => "%A, %B %e %Y")
    "#{d}"
  end
  def format_times(time)
    t = I18n.localize(time, :format => "%l:%M%p").downcase
    "#{t}"
  end
  
end
