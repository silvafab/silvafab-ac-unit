class ListDevicesService
  def self.run
    Device.with_sql('select devices.*, readings.health_status from devices INNER JOIN readings on devices.serial = readings.serial ORDER BY readings.created_at DESC LIMIT 1').all
  end
end
