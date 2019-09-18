require 'spec_helper'

RSpec.describe '#build_colors' do
  let(:x_sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(x_sample, options)
  }

  context 'colors is nil' do
    let(:options) {
      {
        colors: nil
      }
    }
    let(:expected_built) {
      {
        colors: nil
      }
    }

    it 'return colors with nil value' do
      ob.build_colors
      expect(ob.built).to match(expected_built)
    end
  end

  context 'colors is array' do
    let(:options) {
      {
        colors: ['#FFAABB', '#AABB33']
      }
    }
    let(:expected_built) {
      {
        colors: ['#FFAABB', '#AABB33']
      }
    }

    it 'return colors with array value' do
      ob.build_colors
      expect(ob.built).to match(expected_built)
    end
  end

  context 'colors is anything else' do
    let(:options) {
      {
        colors: '#AABB33'
      }
    }
    let(:expected_built) {
      {
        colors: ['#AABB33']
      }
    }

    it 'return colors with array value' do
      ob.build_colors
      expect(ob.built).to match(expected_built)
    end
  end
end
