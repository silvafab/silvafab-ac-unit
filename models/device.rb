class Device < Sequel::Model
  one_to_many :readings, key: :serial

  attr_accessor :health_status
  attr_accessor :carbon_monoxide

  def show_alert
    ['needs_service', 'needs_new_filter', 'gas_leak'].include? self[:health_status] || self[:carbon_monoxide] >= 9
  end
end
