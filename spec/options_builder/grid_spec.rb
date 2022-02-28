# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'grid options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'boolean grid' do
    let(:options) {
      {
        grid: true
      }
    }
    let(:expected_built) {
      {
        grid: {
          show: true
        }
      }
    }

    it 'adds show key with the boolean as the value' do
      ob.build_grid
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash grid' do
    let(:options) {
      {
        grid: {
          show: true,
          border_color: 'blue',
          position: 'front'
        }
      }
    }
    let(:expected_built) {
      {
        grid: {
          show: true,
          borderColor: 'blue',
          position: 'front'
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_grid
      expect(ob.built).to match(expected_built)
    end
  end
end
