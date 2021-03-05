require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/text')
require('./lib/boards')
also_reload('lib/**/*.rb')

get ('/') do
  @boards = Boards.all()
  erb(:boards)
end

get ('/board/new') do
  erb(:new_board)
end

post ('/board/new') do
  board = Boards.new(topic: params[:board_name])
  board.save()
  redirect to '/'
end

get ('/board/:id') do
  @board = Boards.find(params[:id].to_i())
  @texts = Text.find(params[:id].to_i())
  erb(:board)
end

post ('/board/:id') do
  @board = Boards.find(params[:id].to_i())
  Text.new(text: params[:input_text], board_id: params[:id].to_i()).save()
  @texts = Text.find(params[:id].to_i())
  erb(:board)
end