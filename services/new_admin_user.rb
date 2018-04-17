class NewAdminUserService

  def self.run(email, password)
    @validator = NewAdminUserValidator.new(email: email, password: password)

    if @validator.valid?
      AdminUser.create(@validator.attributes)
      return true
    else
      return false
    end

  end
end
