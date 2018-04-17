class Device < Sequel::Model
  one_to_many :readings, key: :serial

  attr_accessor :health_status
end
