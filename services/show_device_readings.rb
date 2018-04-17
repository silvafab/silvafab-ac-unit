class ShowDeviceReadingsService
  def self.run(serial, params)
    device = Device[serial]
  end
end
