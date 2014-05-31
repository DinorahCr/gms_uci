class Event < ActiveRecord::Base
  #before_save :edit_times
  validates_presence_of :title
  validates_presence_of :date
  validates_presence_of :times
  validates_presence_of :body
  has_event_calendar
    #getter
    def times 
     [start_at, end_at].join(' ')
    end 
    #setter
    def times=(t)
      split = t.split(' ', 2)
      self.start_at = (self.date.to_s + " " + split.first).to_datetime
      self.end_at = (self.date.to_s + " " + split.last).to_datetime
    end 
end
