require_relative '../../ch5_functions/anagram_checker'

describe 'AnagramChecker' do
  let(:checker) { AnagramChecker.new }

  it 'should calculate an empty array length' do
    check = checker.array_length []
    expect(check).to eq 0
  end

  it 'should calculate an non-empty array length' do
    check = checker.array_length ['p', 'u', 'm', 'p', 'k', 'i', 'n']
    expect(check).to eq 7
  end

  it 'should return true if the words are the same length' do
    word1 = 'popscicle'
    word2 = 'fruitcake'
    check = checker.same_length? word1, word2
    expect(check).to be true
  end

  it 'should return false if the words are not the same length' do
    word1 = 'popscicle'
    word2 = 'fruit'
    check = checker.same_length? word1, word2
    expect(check).to be false
  end

  it 'should correctly identify an anagram pair' do
    check = checker.is_anagram? 'note', 'tone'
    expect(check).to be true
  end

  it 'should correctly identify a non anagram pair' do
    check = checker.is_anagram? 'test', 'tse'
    expect(check).to be false
  end
end

