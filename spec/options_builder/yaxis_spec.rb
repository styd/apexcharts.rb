require 'spec_helper'

RSpec.describe '#build_yaxis' do
  let(:x_sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(x_sample, options)
  }

  context 'yaxis is a string' do
    let(:options) {
      {
        ytype: 'numeric',
        ytitle: 'Y-Title',
        yaxis: 'Title'
      }
    }
    let(:expected_built) {
      {
        yaxis: [{
          type: 'numeric',
          title: {
            text: 'Title'
          }
        }]
      }
    }

    it 'choose yaxis string value over ytitle for the title' do
      ob.build_yaxis
      expect(ob.built).to match(hash_including(expected_built))
    end
  end

  context 'yaxis is a hash' do
    let(:options) {
      {
        ytype: 'numeric',
        ytitle: 'Y-Title',
        yaxis: {
          type: 'datetime'
        }
      }
    }
    let(:expected_built) {
      {
        yaxis: [{
          type: 'datetime',
          title: {
            text: 'Y-Title'
          }
        }]
      }
    }

    it 'choose type in yaxis over ytype' do
      ob.build_yaxis
      expect(ob.built).to match(hash_including(expected_built))
    end
  end
end
