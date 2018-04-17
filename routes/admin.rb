
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
        result = ShowDeviceReadingsService.run(inbox[:serial], params)
        render("views/admin/show_device_readings.mote", device: result[:device], time_period: params['period'], readings: result[:readings], date_from: result[:date_from], date_to: result[:date_to])
      end
    end
  end

  on "sign_in" do
    get do
      render("views/admin/sign_in.mote")
    end

    post do
      message = ""
      if login(AdminUser, req[:email], req[:password]).nil?
        message = "Wrong username/password"
        res.redirect "/admin/sign_in?message=#{message}"
      else
        res.redirect '/admin/devices'
      end
    end
  end

  on "sign_out" do
    post do
      logout(AdminUser)
      res.redirect "/admin/sign_in"
    end
  end

end
