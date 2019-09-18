require 'spec_helper'

RSpec.describe '#build_fill' do
  let(:x_sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(x_sample, options)
  }

  context 'string fill' do
    let(:options) {
      {
        fill: 'gradient'
      }
    }
    let(:expected_built) {
      {
        fill: {
          type: 'gradient'
        }
      }
    }

    it 'adds type key with the string as the value' do
      ob.build_fill
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash fill' do
    let(:options) {
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

    it 'keeps the hash intact' do
      ob.build_fill
      expect(ob.built).to match(options)
    end
  end
end
