module ComicBoardsHelper
    @today = Date.current
    module_function

    def today_is_holiday?
        return HolidayJp.holiday?(@today)
    end

    def next_monday_is_holiday?
        next_monday = @today.next_week(:monday)
        puts "来週の月曜日:" + next_monday.to_s
    end

    def saturday_release_dates
        #1年間の祝日取得
        holidays = HolidayJp.between(@today.beginning_of_year, @today.end_of_year)
        saturday_release_dates = []
        holidays.each do |d|
            if d.date.monday?
                saturday_release_dates << d.date.next_occurring(:saturday)
            end
        end
        return saturday_release_dates
    end

    #先週の月曜日が平日or祝日かを返す
    def prev_monday_workday?
        prev_monday = @today.prev_week(:monday)
        return prev_monday.workday?  
    end
    
end
