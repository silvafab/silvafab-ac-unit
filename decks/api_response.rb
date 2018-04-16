require 'json'

class ApiResponse < Syro::Deck
  def json(obj)
    res.json JSON.dump(obj)
  end
end

