require 'spec_helper'

RSpec.describe '#build_stroke' do
  let(:x_sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(x_sample, options)
  }

  context 'string curve' do
    let(:options) {
      {
        curve: 'straight'
      }
    }
    let(:expected_built) {
      {
        stroke: {
          curve: 'straight'
        }
      }
    }

    it 'adds show key with the boolean as the value' do
      ob.build_stroke
      expect(ob.built).to match(expected_built)
    end
  end

  context 'boolean stroke' do
    let(:options) {
      {
        stroke: false
      }
    }
    let(:expected_built) {
      {
        stroke: {
          show: false
        }
      }
    }

    it 'adds show key with the boolean as the value' do
      ob.build_stroke
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash stroke' do
    let(:options) {
      {
        stroke: {
          show: true,
          line_cap: 'round'
        }
      }
    }
    let(:expected_built) {
      {
        stroke: {
          show: true,
          lineCap: 'round'
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_stroke
      expect(ob.built).to match(expected_built)
    end
  end
end
