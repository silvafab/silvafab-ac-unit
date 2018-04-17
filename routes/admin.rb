Admin = Syro.new(Frontend) do
  page[:title] = "Welcome"

  on "devices" do
    get do
      render("views/admin/list_devices.mote")
    end
  end

end
