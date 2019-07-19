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
end

