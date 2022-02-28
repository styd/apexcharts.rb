# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'legend options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'boolean legend' do
    let(:options) {
      {
        legend: true
      }
    }
    let(:expected_built) {
      {
        legend: {
          show: true
        }
      }
    }

    it 'adds show key with the boolean as the value' do
      ob.build_legend
      expect(ob.built).to match(expected_built)
    end
  end

  context 'string legend' do
    let(:options) {
      {
        legend: 'top'
      }
    }
    let(:expected_built) {
      {
        legend: {
          show: true,
          position: 'top'
        }
      }
    }

    it 'adds show key with value true and position key with the string as the value' do
      ob.build_legend
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash legend' do
    let(:options) {
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

    it 'keeps the hash intact' do
      ob.build_legend
      expect(ob.built).to match(options)
    end
  end
end
