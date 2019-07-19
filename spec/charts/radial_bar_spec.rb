require 'spec_helper'

RSpec.describe ApexCharts::RadialBarChart do
  let(:data) {
    [
      {name: "Series A", data: 25},
      {name: "Series B", data: 40},
      {name: "Series C", data: 80},
      {name: "Series D", data: 55}
    ]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(data, options)
    expect(chart.chart_type).to eq('radialBar')
  end
end

