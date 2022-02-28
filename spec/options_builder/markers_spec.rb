# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'markers options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'string markers' do
    let(:options) {
      {
        markers: 'square'
      }
    }
    let(:expected_built) {
      {
        markers: {
          shape: 'square'
        }
      }
    }

    it 'adds shape key with the string as the value' do
      ob.build_markers
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash markers' do
    let(:options) {
      {
        markers: {
          size: 4,
          stroke_width: 2,
          radius: 3,
          hover: {
            size: 5
          }
        }
      }
    }
    let(:expected_built) {
      {
        markers: {
          size: 4,
          strokeWidth: 2,
          radius: 3,
          hover: {
            size: 5
          }
        }
      }
    }
    it 'only camelizes the hash' do
      ob.build_markers
      expect(ob.built).to match(expected_built)
    end
  end
end
