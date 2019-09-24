require 'spec_helper'

RSpec.describe ApexCharts::RadialBarChart do
  let(:data) {
    [
      {name: 'Series A', data: 25},
      {name: 'Series B', data: 40},
      {name: 'Series C', data: 80},
      {name: 'Series D', data: 55}
    ]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(data, options)
    expect(chart.chart_type).to eq('radialBar')
  end

  context 'when the series is empty' do
    let(:data) { [] }

    it 'assigned properties correctly' do
      chart = described_class.new(data, options)
      expect(chart.chart_type).to eq('radialBar')
    end
  end

  context 'when a hash series is empty' do
    let(:data) {
      [
        {
          name: 'series',
          data: []
        }
      ]
    }

    it 'assigned properties correctly' do
      chart = described_class.new(data, options)
      expect(chart.chart_type).to eq('radialBar')
    end
  end
end
