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

  context '.config' do
    it 'returns instance of ApexCharts::Configuration' do
      expect(described_class.config).to(
        be_instance_of ApexCharts::Configuration
      )
    end

    it 'includes attribute modules' do
      expect(described_class.config.class).to be < ApexCharts::DefaultOptions
    end
  end

  context '.configure' do
    context 'when block not given' do
      it 'returns config' do
        expect(described_class.configure).to(
          be_instance_of ApexCharts::Configuration
        )
      end
    end

    context 'when block given' do
      it 'yields config' do
        described_class.configure do |config|
          expect(config).to be_instance_of ApexCharts::Configuration
        end
      end
    end
  end
end
