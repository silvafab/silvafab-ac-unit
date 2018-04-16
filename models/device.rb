class Device < Sequel::Model
  one_to_many :readings, key: :serial
end
