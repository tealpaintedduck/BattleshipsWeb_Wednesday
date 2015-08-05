require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  get '/set_up' do
    @name = params[:name]
    $game = Game.new(Player,Board)
    $game.player_1.place_ship Ship.battleship, :B4, :vertically
    $game.player_1.place_ship Ship.destroyer, :C4, :vertically
    $game.player_1.place_ship Ship.submarine, :D4, :vertically
    $game.player_1.place_ship Ship.cruiser, :E4, :vertically
    $game.player_1.place_ship Ship.aircraft_carrier, :F4, :vertically
    erb :set_up
  end

  get '/game_page' do
    erb :game_page
  end

  set :views, proc { File.join(root, '..', 'views') }

  # start the server if ruby file executed directly
  run! if app_file == $0
end
