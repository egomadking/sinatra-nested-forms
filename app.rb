require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get "/" do
      erb :root
    end

    get "/new" do
      erb :"pirates/new"
    end

    post "/pirates" do
      pirate = params[:pirate]
      ships = params[:pirate][:ships]
      @new_pirate = Pirate.new(name: pirate[:name], weight: pirate[:weight], height: pirate[:height])
      @new_ships = []
      ships.each do |ship|
        @new_ships << Ship.new(name: ship[:name], type: ship[:type], booty: ship[:booty])
      end
      erb :"pirates/show"
    end

  end
end
