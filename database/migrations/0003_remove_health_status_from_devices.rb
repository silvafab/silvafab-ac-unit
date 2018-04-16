Sequel.migration do
  up do
    alter_table :devices do
      drop_column :health_status
    end
  end
end
