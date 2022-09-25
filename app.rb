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
  @words = Word.all
  erb(:words)
end

get('/word/new') do
  erb(:new_word)
end

post('/words') do
  word_input = params[:word_word_input]
  word = Album.new(word_input, nil)
  word.save()
  redirect to('/words')
end