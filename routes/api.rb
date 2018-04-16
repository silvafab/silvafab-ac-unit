Api = Syro.new(ApiResponse) do
  on 'register' do
    post do
      begin
        RegisterDeviceService.run(req[:serialNumber], req[:firmwareVersion])
      rescue Sequel::UniqueConstraintViolation => ex
        res.status = 400
        json errors: {serialNumner: "already registered"}
      end
      json ""
    end
  end

  on 'devices/:serial/readings' do
    post do
      RegisterreadingService.run()
    end
  end
end

