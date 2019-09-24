require 'spec_helper'

RSpec.describe ApexCharts::HeatmapChart do
  let(:data) {
    [[100, 1], [200, 2]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(data, options)
    expect(chart.chart_type).to eq('heatmap')
  end

  context 'when the series is empty' do
    let(:data) { [] }

    it 'assigned properties correctly' do
      chart = described_class.new(data, options)
      expect(chart.chart_type).to eq('heatmap')
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
      expect(chart.chart_type).to eq('heatmap')
    end
  end
end
