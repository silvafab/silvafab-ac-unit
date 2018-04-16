Sequel.migration do
  up do
    create_table :readings do
      primary_key [:serial, :created_at], name: :readings_pk
      foreign_key :serial, :devices, type: 'varchar(255)'
      BigDecimal :temperature, size: [3, 2]
      BigDecimal :air_humidity, size: [3, 2]
      BigDecimal :carbon_monoxide, size: [3, 2]
      String :health_status, text: false
      DateTime :created_at
    end
  end
end
