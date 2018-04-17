Admin = Syro.new(Frontend) do
  page[:title] = "Welcome"

  on "devices" do
    get do
      params = Rack::Utils.parse_nested_query(req.query_string)
      devices = ListDevicesService.run(params)
      render("views/admin/list_devices.mote", devices: devices, params: params)
    end
  end

end
