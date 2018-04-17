require 'scrivener'
class NewAdminUserValidator < Scrivener
  attr_accessor :email
  attr_accessor :password

  def validate
    if assert_present :email
      assert AdminUser[email: email].nil?, [:email, :not_unique]
      assert_present :password
    end
  end
end
