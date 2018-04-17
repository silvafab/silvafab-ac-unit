require 'shield'

class AdminUser < Sequel::Model
  include Shield::Model

  def self.fetch(email)
    AdminUser[email: email, blocked: false]
  end

end
