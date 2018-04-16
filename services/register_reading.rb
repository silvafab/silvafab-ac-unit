class RegisterReadingService
  def self.run(serial, temp, air_humidity, carbon_monoxide, health)
    Reading.unrestrict_primary_key

    device = Device[serial]
    raise RecordNotFound unless device

    reading = Reading.create(
      temperature: temp,
      air_humidity: air_humidity,
      carbon_monoxide: carbon_monoxide,
      health_status: health,
      created_at: Time.now
    )

    device.add_reading(reading)
  end
end
