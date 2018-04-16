require 'dotenv/tasks'

task migrate: :dotenv do
  require './database/config'
  `sequel -m ./database/migrations #{ENV['DATABASE_URL']}`
end
