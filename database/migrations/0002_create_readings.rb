Sequel.migration do
  up do
    create_table :readings do
      primary_key :id
      foreign_key :serial, :devices, type: 'varchar(255)'
      BigDecimal :temperature, size: [5, 2]
      BigDecimal :air_humidity, size: [5, 2]
      BigDecimal :carbon_monoxide, size: [5, 2]
      String :health_status, text: false
      DateTime :created_at
    end
  end
end
