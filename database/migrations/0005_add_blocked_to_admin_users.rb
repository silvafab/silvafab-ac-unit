Sequel.migration do
  up do
    alter_table :admin_users do
      add_column :blocked, FalseClass, default: false
    end
  end
end
