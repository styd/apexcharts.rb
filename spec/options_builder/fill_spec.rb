require 'spec_helper'

RSpec.describe '#build_fill' do
  let(:x_sample) { nil }
  let(:string_fill) {
    {
      fill: 'gradient'
    }
  }
  let(:hash_fill) {
    {
      fill: {
        type: 'gradient',
        gradient: {
          shade: 'dark',
          type: 'horizontal'
        }
      }
    }
  }
  let(:string_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, string_fill)
  }
  let(:hash_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, hash_fill)
  }
  let(:expected_string_built) {
    {
      fill: {
        type: 'gradient'
      }
    }
  }

  context "string fill" do
    it 'adds type key with the string as the value' do
      string_ob.build_fill
      expect(string_ob.built).to match(hash_including(expected_string_built))
    end
  end

  context "hash fill" do
    it 'keeps the hash intact' do
      hash_ob.build_fill
      expect(hash_ob.built).to match(hash_including(hash_fill))
    end
  end
end


