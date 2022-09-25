require 'rspec'
require 'word'

describe '#Word' do
  
  before(:each) do
    Word.clear()
    # word1 = Word.new("song", nil)
    # word2 = Word.new("world", nil)
  end
  describe('.all') do
    it("if there is no words returns an empty array") do
      expect(Word.all).to(eq[])
    end
  end

  describe('#save') do
   it("saves a word") do
    word1 = Word.new("song", nil)
    word1 = save()
    word2 = Word.new("world", nil)
    word2 = save()
    expect(Word.all).to(eq([word1, word2]))
   end
  end

  describe('#==') do
    it("compare two words if they have same attributes") do
      word1 = Word.new("song", nil)
      word2 = Word.new("song", nil)
      expect(word1).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
    word1 = Word.new("song", nil)
    word1 = save()
    word2 = Word.new("world", nil)
    word2 = save()
    Word.clear()
    expect(Word.all).to(eq([]))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word1 = Word.new("song", nil)
      word1 = save()
      word1.update("nice song")
      expect(Word.word1).to(eq("nice song"))
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word1 = Word.new("song", nil)
      word1 = save()
      word2 = Word.new("world", nil)
      word2 = save()
      word1.delete()
      expect(Word.all).to(eq([word2]))
    end 
  end
end