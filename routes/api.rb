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

  on 'devices' do
    on :serial do
      on 'readings' do
        post do
          begin
          RegisterReadingService.run(
            inbox[:serial],
            req[:temperature],
            req[:airHumidity],
            req[:carbonMonoxide],
            req[:healthStatus]
          )
          rescue RecordNotFound
            res.status = 404
            res.write ""
          end
        end
      end
    end
  end
end

