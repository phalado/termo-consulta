# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::WordsController, type: :controller do
  describe '#locate' do
    let!(:word1) { create(:word, word: 'abcde') }
    let!(:word2) { create(:word, word: 'fghij') }

    it 'return words' do
      Word.reindex
      get :locate, params: { search_array: %w[a f] }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).count).to eq(2)
      expect(JSON.parse(response.body)['result'].include?(word1.word)).to be_truthy
      expect(JSON.parse(response.body)['result'].include?(word2.word)).to be_truthy
    end
  end
end
