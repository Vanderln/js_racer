get '/' do
  erb :index
end

post '/login' do
  @player1 = Player.find_or_create_by_initials(params[:post][:player1].upcase)  
  @player2 = Player.find_or_create_by_initials(params[:post][:player2].upcase)
  session[:player1] = @player1.id
  session[:player2] = @player2.id
  @game = Game.create
  @player1.games << @game
  @player2.games << @game
  if @player1.save && @player2.save
    redirect "/games/#{@game.id}"
  else
    erb :index
  end
end

post '/finished/game_over' do 
  p params.inspect  # {"time"=>"3062", "winner"=>"ANK", "loser"=>"CVB", "game_id"=>"9"}
  @winner = Player.find_by_initials(params[:winner])
  @loser = Player.find_by_initials(params[:loser])

  puts "The winner is #{@winner.id}"
  puts "The loser is #{@loser.id}"

  @win_time = (params[:time].to_i/1000.0).round(3)
  @game = Game.find_by_id(params[:game_id].to_i) 
  @url = "/gamelookup/#{@game.id}" 
  @game.update_attributes(:winner => @winner, :loser => @loser, 
                          :win_time => @win_time, :url => @url)
  @all_games = Game.where('winner_id IS NOT NULL')
  puts "The games are: #{@all_games.inspect}"
  erb :_results, :layout => false
end

get '/gamelookup/:game_id' do
  @game = Game.find_by_id(params[:game_id])
  erb :game_results
end

get '/games/:game_id' do
  @game = Game.find_by_id(params[:game_id].to_i)
  @game_id = params[:game_id]
  # p @game.players[1].initials.inspect
  @player1 = @game.players.first
  @player2 = @game.players.last
  erb :game
end

get '/rematch' do
  @player1 = Player.find_by_id(session[:player1])  
  @player2 = Player.find_by_id(session[:player2])
  @game = Game.create
  @player1.games << @game
  @player2.games << @game
  if @player1.save && @player2.save
    erb :game
  else
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

