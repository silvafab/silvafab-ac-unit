Api = Syro.new(ApiResponse) do
  on 'register' do
    post do
      json status: "Hello there", date: "Today"
    end
  end
end

