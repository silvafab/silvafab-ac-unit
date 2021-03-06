require 'shield'
require 'mote'
require 'tas'

class Frontend < Syro::Deck
  include Shield::Helpers
  include Mote::Helpers

  def session
    req.session
  end

  def view
    @view ||= Tas.new do |params|
      mote(params[:src], params)
    end
  end

  def page
    @page ||= view.new.tap do |page|
      page[:src] = "views/layout.mote"
      page[:content] = view.new
      page[:content][:app] = self
    end
  end

  def render(path, params = {})
    page[:content][:src] = path
    page[:content].update(params)

    res.html(page)
  end

  def check_auth
    unless authenticated(AdminUser)
      session[:message] = "You must log in first"
      res.redirect "/admin/sign_in"
    end
  end
end
