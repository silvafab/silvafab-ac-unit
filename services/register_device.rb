class RegisterDeviceService

  def self.run(serial_number, firmware_version)
      Device.unrestrict_primary_key
      Device.create(
        serial: serial_number,
        firmware_version: firmware_version
      )
  end

end
