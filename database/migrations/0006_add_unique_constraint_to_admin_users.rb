Sequel.migration do
  up do
    alter_table :admin_users do
      add_index :email, unique: true
    end
  end
end
