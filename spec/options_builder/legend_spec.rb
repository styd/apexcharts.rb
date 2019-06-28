require 'spec_helper'

RSpec.describe '#build_legend' do
  let(:x_sample) { nil }
  let(:boolean_legend) {
    {
      legend: true
    }
  }
  let(:string_legend) {
    {
      legend: 'top'
    }
  }
  let(:hash_legend) {
    {
      legend: {
        show: true,
        floating: true,
        markers: {
          width: 10,
          height: 10
        }
      }
    }
  }
  let(:boolean_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, boolean_legend)
  }
  let(:string_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, string_legend)
  }
  let(:hash_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, hash_legend)
  }
  let(:expected_boolean_built) {
    {
      legend: {
        show: true
      }
    }
  }
  let(:expected_string_built) {
    {
      legend: {
        show: true,
        position: 'top'
      }
    }
  }

  context "boolean legend" do
    it 'adds show key with the boolean as the value' do
      boolean_ob.build_legend
      expect(boolean_ob.built).to match(hash_including(expected_boolean_built))
    end
  end

  context "boolean legend" do
    it 'adds show key with value true and position key with the string as the value' do
      string_ob.build_legend
      expect(string_ob.built).to match(hash_including(expected_string_built))
    end
  end

  context "hash legend" do
    it 'keeps the hash intact' do
      hash_ob.build_legend
      expect(hash_ob.built).to match(hash_including(hash_legend))
    end
  end
end


