require 'spec_helper'

RSpec.describe ApexCharts::RadarChart do
  let(:data) {
    [[100, 1], [200, 2], [300, 3]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(data, options)
    expect(chart.chart_type).to eq('radar')
  end
end
