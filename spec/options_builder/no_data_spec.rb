require 'spec_helper'

RSpec.describe '#build_no_data' do
  let(:x_sample) { nil }
  let(:string_no_data) {
    {
      no_data: 'Data not available'
    }
  }
  let(:hash_no_data) {
    {
      no_data: {
        text: 'You got no data',
        align: 'left',
        vertical_align: 'top'
      }
    }
  }
  let(:string_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, string_no_data)
  }
  let(:hash_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, hash_no_data)
  }
  let(:expected_string_built) {
    {
      noData: {
        text: 'Data not available'
      }
    }
  }
  let(:expected_hash_built) {
    {
      noData: {
        text: 'You got no data',
        align: 'left',
        verticalAlign: 'top'
      }
    }
  }

  context "string no_data" do
    it 'adds shape key with the string as the value' do
      string_ob.build_no_data
      expect(string_ob.built).to match(hash_including(expected_string_built))
    end
  end

  context "hash no_data" do
    it 'only camelizes the hash' do
      hash_ob.build_no_data
      expect(hash_ob.built).to match(hash_including(expected_hash_built))
    end
  end
end


