Admin = Syro.new(Frontend) do
  page[:title] = "Welcome"

  on "devices" do
    get do

      check_auth

      params = Rack::Utils.parse_nested_query(req.query_string)
      devices = ListDevicesService.run(params)
      render("views/admin/list_devices.mote", devices: devices, params: params)
    end

    on :serial do
      get do

        check_auth

        params = Rack::Utils.parse_nested_query(req.query_string)
        result = ShowDeviceReadingsService.run(inbox[:serial], params)
        render("views/admin/show_device_readings.mote", device: result[:device], time_period: params['period'], readings: result[:readings], date_from: result[:date_from], date_to: result[:date_to])
      end
    end
  end

  on "users" do
    get do
      check_auth
      admins = AdminUser.order(:id).all
      render("views/admin/list_admins.mote", admins: admins)
    end

    on "new" do
      get do
        check_auth
        message = session[:message]
        render("views/admin/new_user.mote", message: message)
      end
      
      post do
        result = NewAdminUserService.run(req[:email], req[:password])
        unless result
          session[:message] = "Email taken"
          res.redirect '/admin/users/new'
        end
        res.redirect '/admin/users'
      end

    end

    on :id do
      on "block" do
        post do
          check_auth
          ToggleBlockedUserService.run(inbox[:id])
          res.redirect '/admin/users'
        end
      end
    end
  end

  on "sign_in" do
    get do
      render("views/admin/sign_in.mote", message: session[:message])
    end

    post do
      if login(AdminUser, req[:email], req[:password]).nil?
        session[:message] = "Wrong username/password"
        res.redirect "/admin/sign_in"
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
