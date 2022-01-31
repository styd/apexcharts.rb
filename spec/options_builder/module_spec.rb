# frozen_string_literal: true

require 'spec_helper'

RSpec.describe '#build_module' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }
  let(:options) { {} }

  context 'module is nil' do
    let(:expected_built) {
      {
        module: false
      }
    }

    it 'return module with nil value' do
      ob.build_module
      expect(ob.built).to match(expected_built)
    end
  end

  context 'module is correctly handled when true' do
    let(:options) { {module: true} }
    let(:expected_built) {
      {
        module: true
      }
    }

    it 'return module with nil value' do
      ob.build_module
      expect(ob.built).to match(expected_built)
    end
  end
end
