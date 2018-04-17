Sequel.migration do
  up do
    create_table :admin_users do
      primary_key :id
      String :email, text: false
      String :crypted_password, text: false
      DateTime :created_at
    end
  end
end
