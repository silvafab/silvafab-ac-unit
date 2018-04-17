class RegisterDeviceService

  def self.run(serial_number, firmware_version)
      Device.unrestrict_primary_key
      Device.create(
        serial: serial_number.downcase,
        firmware_version: firmware_version,
        created_at: Time.now
      )
  end

end
