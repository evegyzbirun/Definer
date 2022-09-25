require 'rspec'
require 'definition'
require 'word'
require 'pry'


describe '#Definition' do

before(:each) do
  Word.clear
  Definition.clear
  @word = Word.new("game", nil)
  @word.save()
end

describe('.all') do
  it("list of all definitions about a word") do
      definition = Definition.new("a sport competition", @word.id, nil)
      definition.save()
      definition2 = Definition.new("play on computer", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
  end 
end

describe('#==') do
    it("") do
      definition = Song.new("a sport competition", @word.id, nil)
      definition2 = Song.new("a sport competition", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end
end