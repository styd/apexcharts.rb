# frozen_string_literal: true

RSpec.describe '#build_responsive' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'responsive is nil' do
    let(:options) {
      {
        responsive: nil
      }
    }
    let(:expected_built) {
      {
        responsive: nil
      }
    }

    it 'return responsive with nil value' do
      ob.build_responsive
      expect(ob.built).to match(expected_built)
    end
  end

  context 'responsive is array' do
    let(:options) {
      {
        responsive: [{breakpoint: 300, options: {}}]
      }
    }
    let(:expected_built) {
      {
        responsive: [{breakpoint: 300, options: {}}]
      }
    }

    it 'return responsive with array value' do
      ob.build_responsive
      expect(ob.built).to match(expected_built)
    end
  end

  context 'responsive is anything else' do
    let(:options) {
      {
        responsive: {breakpoint: 300, options: {}}
      }
    }
    let(:expected_built) {
      {
        responsive: [{breakpoint: 300, options: {}}]
      }
    }

    it 'return responsive with array value' do
      ob.build_responsive
      expect(ob.built).to match(expected_built)
    end
  end
end
