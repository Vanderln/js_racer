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
    erb :game
  else
    erb :index
  end

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

 post '/game_over' do
    @winner = Player.find_by_initials(params[:winner])
    @loser = Player.find_by_initials(params[:loser])
    @win_time = (params[:time].to_i/1000.0).round(3)
    # @race = Race.find_by_id(params[:race_id])
    
    
    @game = Game.find_by_id(params[:game_id]) 
    @url = "/games/#{@game.id}" 
    @game.update_attributes(:winner => @winner.initials, :loser => @loser.initials, 
                            :win_time => @win_time, :url => @url)
    # @race.update_attributes(game_id: @game.id)
    @all_games = Game.all
    erb :_results, :layout => false
 end

get '/games/:game_id' do
  @game = Game.find_by_id(params[:game_id])
  erb :game_results
end
