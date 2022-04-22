require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'validations' do
    let!(:word) { create(:word) }

    it { should validate_presence_of :word }
    it { should validate_uniqueness_of :word }
    it { should validate_length_of(:word).is_equal_to(5) }
  end

  describe 'callbacks' do
    it { should callback(:save_letters).after(:save) }
  end

  describe 'methods' do
    let!(:word) { build(:word) }
    
    it 'save_letters' do
      expect(word.letters).to be_empty

      word.save_letters
      expect(word.letters.length).to be(5)
    end
  end
end