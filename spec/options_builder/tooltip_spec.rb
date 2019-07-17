require 'spec_helper'

RSpec.describe '#build_tooltip' do
  let(:x_sample) { nil }
  let(:ob) {
    Apexcharts::OptionsBuilder.new(x_sample, options)
  }

  context "boolean tooltip" do
    let(:options) {
      {
        tooltip: true
      }
    }
    let(:expected_built) {
      {
        tooltip: {
          enabled: true
        }
      }
    }

    it 'adds show key with the boolean as the value' do
      ob.build_tooltip
      expect(ob.built).to match(hash_including(expected_built))
    end
  end

  context "hash tooltip" do
    let(:options) {
      {
        tooltip: {
          shared: false,
          follow_cursor: true
        }
      }
    }
    let(:expected_built) {
      {
        tooltip: {
          shared: false,
          followCursor: true
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_tooltip
      expect(ob.built).to match(hash_including(expected_built))
    end
  end
end


