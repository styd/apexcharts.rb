require 'spec_helper'

RSpec.describe '#build_markers' do
  let(:x_sample) { nil }
  let(:string_markers) {
    {
      markers: 'square'
    }
  }
  let(:hash_markers) {
    {
      markers: {
        size: 4,
        stroke_width: 2,
        radius: 3,
        hover: {
          size: 5
        }
      }
    }
  }
  let(:string_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, string_markers)
  }
  let(:hash_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, hash_markers)
  }
  let(:expected_string_built) {
    {
      markers: {
        shape: 'square'
      }
    }
  }

  context "string markers" do
    it 'adds shape key with the string as the value' do
      string_ob.build_markers
      expect(string_ob.built).to match(hash_including(expected_string_built))
    end
  end

  context "hash markers" do
    it 'keeps the hash intact' do
      hash_ob.build_markers
      expect(hash_ob.built).to match(hash_including(hash_markers))
    end
  end
end


