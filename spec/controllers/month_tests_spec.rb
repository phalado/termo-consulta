require 'rails_helper'

RSpec.describe Api::V1::MonthTestsController, type: :controller do
  describe '#index' do
    let!(:test1) { create(:month_test) }
    let!(:test2) { create(:month_test, month: 'january', returned_value: 1) }

    before { get :index }

    it 'return all data' do
      expect(response.status).to eq(200)
      data = JSON.parse(response.body)['data']
      expect(data.count).to eq(2)
      expect(data.pluck('month').include?('january')).to be_truthy
      expect(data.pluck('month').include?('june')).to be_truthy
    end
  end

  describe '#parse_month' do
    context 'with existing month' do
      subject { get :parse_month, params: { month: 'decembre' } }

      it 'creates a record' do
        expect { subject }.to change { MonthTest.count }.by(1)
      end

      it 'return the value' do
        subject
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)['month_number']).to eq(12)
      end
    end

    context 'with non existing month' do
      subject { get :parse_month, params: { month: 'Raphael' } }

      it 'creates a record' do
        expect { subject }.to change { MonthTest.count }.by(1)
      end

      it 'return the value' do
        subject
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)['month_number']).to be_nil
      end
    end
  end
end
