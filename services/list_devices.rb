class ListDevicesService
  def self.run(params)
    serial = "%#{params['serial']}%"
    Device.with_sql("select devices.*, readings.health_status from devices INNER JOIN readings on devices.serial = readings.serial WHERE devices.serial LIKE ? ORDER BY readings.created_at DESC LIMIT 1", serial).all
  end
end
