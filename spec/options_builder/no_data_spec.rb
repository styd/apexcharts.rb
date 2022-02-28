# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'no_data options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'string no_data' do
    let(:options) {
      {
        no_data: 'Data not available'
      }
    }
    let(:expected_built) {
      {
        noData: {
          text: 'Data not available'
        }
      }
    }
    it 'adds shape key with the string as the value' do
      ob.build_no_data
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash no_data' do
    let(:options) {
      {
        no_data: {
          text: 'You got no data',
          align: 'left',
          vertical_align: 'top'
        }
      }
    }
    let(:expected_built) {
      {
        noData: {
          text: 'You got no data',
          align: 'left',
          verticalAlign: 'top'
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_no_data
      expect(ob.built).to match(expected_built)
    end
  end
end
