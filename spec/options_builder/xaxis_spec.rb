# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'xaxis options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'xaxis is a string' do
    let(:options) {
      {
        xtype: 'numeric',
        xtitle: 'X-Title',
        xaxis: 'Title'
      }
    }
    let(:expected_built) {
      {
        xaxis: {
          type: 'numeric',
          title: {
            text: 'Title'
          }
        }
      }
    }

    it 'choose xaxis string value over xtitle for the title' do
      ob.build_xaxis
      expect(ob.built).to match(expected_built)
    end
  end

  context 'xaxis is a hash' do
    let(:options) {
      {
        xtype: 'numeric',
        xtitle: 'X-Title',
        xaxis: {
          position: 'top',
          type: 'datetime'
        }
      }
    }
    let(:expected_built) {
      {
        xaxis: {
          type: 'datetime',
          title: {
            text: 'X-Title'
          },
          position: 'top'
        }
      }
    }

    it 'choose type in xaxis over xtype' do
      ob.build_xaxis
      expect(ob.built).to match(hash_including(expected_built))
    end
  end

  context 'sample is a time' do
    let(:sample) { Time.now }
    let(:options) {
      {
        xtype: 'numeric'
      }
    }
    let(:expected_built) {
      {
        xaxis: {
          type: 'numeric'
        }
      }
    }

    it 'will disregard sample' do
      ob.build_xaxis
      expect(ob.built).to match(expected_built)
    end
  end

  context 'xaxis is empty' do
    let(:options) { {} }
    let(:expected_built) { {xaxis: nil} }

    it 'returns nil value' do
      ob.build_xaxis
      expect(ob.built).to match(expected_built)
    end
  end
end
