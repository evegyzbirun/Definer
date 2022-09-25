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
end