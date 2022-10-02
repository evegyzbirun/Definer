 require('capybara/rspec')
 require('./app')
 Capybara.app = Sinatra::Application
 set(:show_exceptions, false)

 describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Yellow Submarine')
    click_on('Create!')
    expect(page).to have_content('Yellow Submarine')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a song and then goes to the album page') do
    word = Word.new("Yellow", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'sun in the moring')
    click_on('Add definition')
    expect(page).to have_content('sun in the moring')
  end
end