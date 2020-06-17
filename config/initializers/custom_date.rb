require "date"
require "holiday_jp"

class Date
  def workday?
    #sunday = 0
    #monday-friday = 1..5
    #saturday = 6
    (1..5).include?(self.wday) && HolidayJp.holiday?(self).nil?
  end
end