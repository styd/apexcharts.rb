require 'spec_helper'

RSpec.describe ApexCharts do
  context '.helper_prefix' do
    context 'when not set' do
      it 'returns ENV value' do
        expect(described_class.helper_prefix).to eq ENV['APEXCHARTS_PREFIX']
      end
    end

    context 'when not set' do
      after do
        described_class.helper_prefix = nil
      end

      it 'returns set value' do
        described_class.helper_prefix = 'awesome_'
        expect(described_class.helper_prefix).to eq 'awesome_'
      end
    end
  end
end
