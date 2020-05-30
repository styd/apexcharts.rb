# frozen_string_literal: true

require 'spec_helper'

RSpec.describe '#build_defer' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }
  let(:options) { {} }

  context 'defer is nil' do
    let(:expected_built) {
      {
        defer: false
      }
    }

    it 'return defer with nil value' do
      ob.build_defer
      expect(ob.built).to match(expected_built)
    end
  end

  context 'defer is correctly handled when true' do
    let(:options) { {defer: true} }
    let(:expected_built) {
      {
        defer: true
      }
    }

    it 'return defer with nil value' do
      ob.build_defer
      expect(ob.built).to match(expected_built)
    end
  end
end
