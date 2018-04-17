require 'dotenv/tasks'

task migrate: :dotenv do
  require './database/config'
  `sequel -m ./database/migrations #{ENV['DATABASE_URL']}`
end

task seed: :dotenv do
  require './database/config'
  require './models/admin'
  AdminUser.create(email: 'admin@example.com', password: 'password')
end
