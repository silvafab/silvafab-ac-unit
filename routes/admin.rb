Admin = Syro.new(Frontend) do
  page[:title] = "Welcome"

  on "devices" do
    get do
      params = Rack::Utils.parse_nested_query(req.query_string)
      devices = ListDevicesService.run(params)
      render("views/admin/list_devices.mote", devices: devices, params: params)
    end

    on :serial do
      get do
        params = Rack::Utils.parse_nested_query(req.query_string)
        device = ShowDeviceReadingsService.run(inbox[:serial], params)
        render("views/admin/show_device_readings.mote", device: device, params: params)
      end
    end

  end

end
