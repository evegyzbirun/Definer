#  require('capybara/rspec')
#  require('./app')
#  Capybara.app = Sinatra::Application
#  set(:show_exceptions, false)

#  describe('create a aword path', {:type => :feature}) do
#   it('creates a word and then goes to the word page') do
#     visit('/words')
#     click_on('Add a new word')
#     fill_in('word_name', :with => 'Yellow Submarine')
#     click_on('Create!')
#     expect(page).to have_content('Yellow Submarine')
#   end
# end