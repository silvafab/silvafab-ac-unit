class CheckUnitsNeedingServiceService
  def self.run
    Device.with_sql("SELECT * FROM (SELECT readings.health_status, readings.carbon_monoxide "\
    "FROM devices "\
    "INNER JOIN readings on devices.serial = readings.serial "\
    "ORDER BY readings.created_at DESC LIMIT 1) as subquery "\
    "WHERE subquery.health_status IN ? "\
    "OR subquery.carbon_monoxide >= 9", ['needs_service', 'needs_new_filter', 'gas_leak']).count
  end
end
