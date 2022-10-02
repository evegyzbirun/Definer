require 'rspec'
require 'definition'
require 'word'
require 'pry'


describe '#Definition' do

before(:each) do
  Word.clear()
  Definition.clear()
  @word = Word.new('game', nil)
  @word.save()
end

describe('.all') do
  it("list of all definitions about a word") do
      definition1 = Definition.new("a sport competition", @word.id, 1)
      definition1.save()
      definition2 = Definition.new("play on computer", @word.id, 2)
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
  end 
end

describe('#==') do
    it("is one definition of a word is the same as another definition of the same word") do
      definition = Definition.new("a sport competition", @word.id, nil)
      definition2 = Definition.new("a sport competition", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("a sport competition", @word.id, nil)
      definition.save()
      definition2 = Definition.new("play on computer", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a definitioin by id") do
      definition = Definition.new("a sport competition", @word.id, nil)
      definition.save()
      definition2 = Definition.new("play on computer", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition2.id)).to(eq(definition2))
    end
  end

  describe('#update') do
    it("updates a definitioin by id") do
      definition = Definition.new("a sport competition", @word.id, nil)
      definition.save()
      definition.update("play on computer", @word.id)
      expect(definition.name).to(eq("play on computer"))
    end
  end

  describe('#delete') do
  it("deletes a definition by id") do
      definition = Definition.new("a sport competition", @word.id, nil)
      definition.save()
      definition2 = Definition.new("play on computer", @word.id, nil)
      definition2.save()
      definition.delete()
    expect(Definition.all).to(eq([definition2]))
  end
end

describe('.find_by_word') do
  it("finds definition for a word") do
      word1 = Word.new("Blue", nil)
      word1.save()
      definition1 = Definition.new("a sport competition", word1.id, nil)
      definition1.save()
      definition2 = Definition.new("color of sky", @word.id, nil)
      definition2.save()
    expect(Definition.find_by_word(word1.id)).to(eq([definition1]))
  end
end

describe('#word') do
  it("finds the word a definition belongs to") do
    definition = Definition.new("a sport competition", @word.id, nil)
    definition.save()
    expect(definition.word()).to(eq(@word))
  end
end
end