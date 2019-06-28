require 'spec_helper'

RSpec.describe '#build_data_labels' do
  let(:x_sample) { nil }
  let(:boolean_dl) {
    {
      data_labels: true
    }
  }
  let(:hash_dl) {
    {
      data_labels: {
        enabled: true,
        dropShadow: {
          enabled: false,
          top: 1,
          left: 1,
          blur: 1,
          opacity: 0.45
        }
      }
    }
  }
  let(:boolean_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, boolean_dl)
  }
  let(:hash_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, hash_dl)
  }
  let(:expected_boolean_built) {
    {
      data_labels: {
        enabled: true
      }
    }
  }

  context "boolean data_labels" do
    it 'adds enabled key with the boolean as the value' do
      boolean_ob.build_data_labels
      expect(boolean_ob.built).to match(hash_including(expected_boolean_built))
    end
  end

  context "hash data_labels" do
    it 'keeps the hash intact' do
      hash_ob.build_data_labels
      expect(hash_ob.built).to match(hash_including(hash_dl))
    end
  end
end


