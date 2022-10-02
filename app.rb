require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  if params["search"]
    @words = Word.all(params[:search])
  else
    @words = Word.all
end
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  word_input = params[:word_name]
  word = Word.new(word_input, nil)
  word.save()
  redirect to('/words')
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end


post('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word = Word.all()
  erb(:words)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  if params[:word_name] != ""
    @word = Word.find(params[:id].to_i())
    @word.update(params[:word_name])
  end
    @words = Word.all
    erb(:words)
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

#Definition

get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition_name], @word.id, nil)
  definition.save()
  erb(:word)
end

patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:definition_name], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete()
  @word = Word.find(params[:id].to_i())
  erb(:word)
end