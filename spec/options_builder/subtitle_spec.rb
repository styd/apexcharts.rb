# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'subtitle options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'string subtitle' do
    let(:options) {
      {
        subtitle: 'Which subtitle?'
      }
    }
    let(:expected_built) {
      {
        subtitle: {
          text: 'Which subtitle?'
        }
      }
    }

    it 'adds shape key with the string as the value' do
      ob.build_subtitle
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash subtitle' do
    let(:options) {
      {
        subtitle: {
          text: 'This subtitle.',
          offset_x: 20
        }
      }
    }
    let(:expected_built) {
      {
        subtitle: {
          text: 'This subtitle.',
          offsetX: 20
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_subtitle
      expect(ob.built).to match(expected_built)
    end
  end
end
