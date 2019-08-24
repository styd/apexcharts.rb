require 'spec_helper'

RSpec.describe ApexCharts::CartesianChart do
  let(:bindings) { nil }
  let(:data) {
    [[100, 1], [200, 2]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(bindings, data, options)
    expect(chart.chart_type).to eq(nil)
    expect(chart.more_options).to eq({})
  end
end
