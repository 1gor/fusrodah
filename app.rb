require "roda"
require_relative "./models"

class App < Roda
  plugin :all_verbs
  plugin :public
  plugin :json
  plugin :render, engine: "slim"
  plugin :symbol_views
  plugin :indifferent_params

  route do |r|
    r.public

    r.root do
      view :home
    end
  end

  Dir['./helpers/*.rb'].each{|f| require f}
end
