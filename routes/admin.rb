Admin = Syro.new(Frontend) do
  page[:title] = "Welcome"

  on "devices" do
    get do
      devices = ListDevicesService.run
      render("views/admin/list_devices.mote", devices: devices)
    end
  end

end
