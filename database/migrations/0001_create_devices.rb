Sequel.migration do
  up do
    create_table :devices do
      String :serial, primary_key: true, text: false
      String :firmware_version, text: false
      String :health_status, text: false
      DateTime :created_at
    end
  end
end
