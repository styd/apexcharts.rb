# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'yaxis options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
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
        yaxis: {
          type: 'numeric',
          title: {
            text: 'Title'
          }
        }
      }
    }

    it 'choose yaxis string value over ytitle for the title' do
      ob.build_yaxis
      expect(ob.built).to match(expected_built)
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
        yaxis: {
          type: 'datetime',
          title: {
            text: 'Y-Title'
          }
        }
      }
    }

    it 'choose type in yaxis over ytype' do
      ob.build_yaxis
      expect(ob.built).to match(expected_built)
    end
  end

  context 'yaxis is an array' do
    let(:options) {
      {
        ytype: 'numeric',
        ytitle: 'Y-Title',
        yaxis: [
          {
            type: 'datetime',
            title: {
              text: 'Y-Title 1'
            }
          },
          {
            type: 'datetime',
            title: {
              text: 'Y-Title 2'
            }
          }
        ]
      }
    }
    let(:expected_built) {
      {
        yaxis: [
          {
            type: 'datetime',
            title: {
              text: 'Y-Title 1'
            }
          },
          {
            type: 'datetime',
            title: {
              text: 'Y-Title 2'
            }
          }
        ]
      }
    }

    it 'ignores other yaxis related keys' do
      ob.build_yaxis
      expect(ob.built).to match(expected_built)
    end
  end

  context 'yaxis is empty' do
    let(:options) { {} }
    let(:expected_built) { {yaxis: nil} }

    context 'ytitle is empty too' do
      it 'returns nil value' do
        ob.build_yaxis
        expect(ob.built).to match(expected_built)
      end
    end

    context 'ytitle is NOT empty' do
      let(:options) { {ytitle: 'Y-Title'} }
      let(:expected_built) {
        {
          yaxis: {
            title: {
              text: 'Y-Title'
            }
          }
        }
      }

      it 'returns yaxis with title from ytitle' do
        ob.build_yaxis
        expect(ob.built).to match(expected_built)
      end
    end
  end
end
