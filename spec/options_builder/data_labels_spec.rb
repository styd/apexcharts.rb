# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'data_labels options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'boolean data_labels' do
    let(:options) {
      {
        data_labels: true
      }
    }
    let(:expected_built) {
      {
        dataLabels: {
          enabled: true
        }
      }
    }

    it 'adds enabled key with the boolean as the value' do
      ob.build_data_labels
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash data_labels' do
    let(:options) {
      {
        data_labels: {
          enabled: true,
          drop_shadow: {
            enabled: false,
            top: 1,
            left: 1,
            blur: 1,
            opacity: 0.45
          }
        }
      }
    }
    let(:expected_built) {
      {
        dataLabels: {
          enabled: true,
          dropShadow: {
            enabled: false,
            top: 1,
            left: 1,
            blur: 1,
            opacity: 0.45
          }
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_data_labels
      expect(ob.built).to match(expected_built)
    end
  end
end
