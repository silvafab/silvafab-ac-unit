class ListDevicesService
  def self.run(params)
    serial = "%#{params['serial']}%"
    Device.with_sql("SELECT devices.*, readings.health_status "\
    "FROM devices "\
    "INNER JOIN readings on devices.serial = readings.serial "\
    "WHERE devices.serial LIKE ? ORDER BY readings.created_at DESC LIMIT 1", serial).all
  end
end
