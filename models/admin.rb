require 'shield'

class AdminUser < Sequel::Model
  include Shield::Model

  def self.fetch(email)
    AdminUser[email: email]
  end

end
