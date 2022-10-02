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
  it('creates a definition and then goes to the definition page') do
    word = Word.new("Yellow", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'sun in the moring')
    click_on('Add definition')
    expect(page).to have_content('sun in the moring')
  end
end

describe('update a word', {:type => :feature}) do
  it('updates a word and then goes to the word page') do
    word = Word.new("Green", nil)
    word.save
    visit("/words/#{word.id}/edit")
    fill_in('word_name', :with => 'Blue')
    click_on('Update')
    expect(page).to have_content('Blue')
  end
end

describe('update a definition', {:type => :feature}) do
  it('updates a definition and then goes to the definition page') do
    word = Word.new("Blue", nil)
    word.save
    definition = Definition.new("color of sky", word.id, nil)
    definition.save
    visit("/words/#{word.id}/definitions/#{definition.id}")
    fill_in('definition_name', :with => 'color of water')
    click_on('Edit definition')
    expect(page).to have_content('color of water')
  end
end