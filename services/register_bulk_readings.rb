class RegisterBulkReadingsService
  def self.run(serial, temp, air_humidity, carbon_monoxide, health)
    Reading.unrestrict_primary_key

    device = Device[serial.downcase]
    raise RecordNotFound unless device

    last_time_reported = device.readings.last&.created_at
    last_time_reported ||= Time.now

    # Assume all readings are arrays
    temp.each_with_index do |t, i|

      last_time_reported = last_time_reported + 60
      reading = Reading.create(
        temperature: temp[i],
        air_humidity: air_humidity[i],
        carbon_monoxide: carbon_monoxide[i],
        health_status: health[i],
        created_at: last_time_reported
      )

      device.add_reading(reading)
    end

  end

end
