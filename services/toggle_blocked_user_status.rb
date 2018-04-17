class ToggleBlockedUserService
  def self.run(id)
    user = AdminUser[id]
    user.blocked = !user.blocked
    user.save
  end
end
