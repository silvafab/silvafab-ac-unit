class ShowDeviceReadingsService
  def self.run(serial, params)

    current_date = Time.now

    case params['period']
    when 'week'
      now = Date.today
      beginning_of_week = now - now.wday
      end_of_week =beginning_of_week.to_time + 60*60*24*7 

      date_from = Time.mktime(beginning_of_week.year, beginning_of_week.month, beginning_of_week.day, 0, 0)
      date_to = Time.mktime(end_of_week.year, end_of_week.month, end_of_week.day, 0, 0)
    when 'month'
      date_from = Time.mktime(current_date.year, current_date.month, 1, 0, 0)
      date_to = Time.mktime(current_date.year, current_date.month + 1, 1, 23, 59) - 1
    when 'year'
      date_from = Time.mktime(current_date.year, 1, 1, 0, 0)
      date_to = Time.mktime(current_date.year, 12, 31, 23, 59)
    else
      date_from = Time.mktime(current_date.year, current_date.month, current_date.day, 0, 0)
      date_to = Time.mktime(current_date.year, current_date.month, current_date.day, 23, 59)
    end

    date_from = date_from.strftime('%Y-%m-%d %H:%M:%S')
    date_to = date_to.strftime('%Y-%m-%d %H:%M:%S')

    device = Device[serial]
    readings = Reading.where(serial: serial, created_at: (date_from)..(date_to)).all

    result = {
      device: device,
      readings: readings,
      date_from: date_from,
      date_to: date_to
    }
  end
end
