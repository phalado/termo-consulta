# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'validations' do
    let!(:word) { create(:word) }

    it { should validate_presence_of :word }
    it { should validate_uniqueness_of :word }
    it { should validate_length_of(:word).is_equal_to(5) }
  end

  describe 'callbacks' do
    it { should callback(:save_letters).before(:save) }
  end

  describe 'methods' do
    let!(:word) { build(:word) }

    it 'save_letters' do
      expect(word.letters).to be_empty

      word.save_letters
      expect(word.letters.length).to be(5)
    end

    it { expect(word.l_one).to eq(word.letters[0]) }
    it { expect(word.l_two).to eq(word.letters[1]) }
    it { expect(word.l_three).to eq(word.letters[2]) }
    it { expect(word.l_four).to eq(word.letters[3]) }
    it { expect(word.l_five).to eq(word.letters[4]) }
  end

  describe 'validate_letter' do
    context 'a variations' do
      let!(:word) { create(:word, word: 'áàãâä') }

      it { expect(word.letters).to eq(%w[a a a a a]) }
    end

    context 'e variations' do
      let!(:word) { create(:word, word: 'éèẽêë') }

      it { expect(word.letters).to eq(%w[e e e e e]) }
    end

    context 'i variations' do
      let!(:word) { create(:word, word: 'íìĩîï') }

      it { expect(word.letters).to eq(%w[i i i i i]) }
    end

    context 'o variations' do
      let!(:word) { create(:word, word: 'óòõôö') }

      it { expect(word.letters).to eq(%w[o o o o o]) }
    end

    context 'u variations' do
      let!(:word) { create(:word, word: 'úùũûü') }

      it { expect(word.letters).to eq(%w[u u u u u]) }
    end

    context 'c and n variation' do
      let!(:word) { create(:word, word: 'çñaaa') }

      it { expect(word.letters).to eq(%w[c n a a a]) }
    end
  end

  describe 'fetch' do
    let!(:word1) { create(:word, word: 'abcde') }
    let!(:word2) { create(:word, word: 'fghij') }

    it 'fetch word using specific letter' do
      Word.reindex
      fetched = Word.fetch([], [], 'a', nil, nil, nil, nil)
      expect(fetched.first.word).to eq(word1.word)
      expect(fetched.size).to eq(1)
    end

    it 'fetch word using more than one letter' do
      Word.reindex
      fetched = Word.fetch(%w[f g], [], nil, nil, nil, nil, nil)
      expect(fetched.first.word).to eq(word2.word)
      expect(fetched.size).to eq(1)
    end

    it 'fail to fetch word using more than one letter' do
      Word.reindex
      fetched = Word.fetch(%w[f e], [], nil, nil, nil, nil, nil)
      expect(fetched.size).to eq(0)
    end

    it 'fetch word using removed letter' do
      Word.reindex
      fetched = Word.fetch([], ['d'], nil, nil, nil, nil, nil)
      expect(fetched.first.word).to eq(word2.word)
      expect(fetched.size).to eq(1)
    end

    it 'fails to fetch word using more than one removed letter' do
      Word.reindex
      fetched = Word.fetch([], %w[d f], nil, nil, nil, nil, nil)
      expect(fetched.size).to eq(0)
    end
  end
end
