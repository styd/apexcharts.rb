require 'spec_helper'

RSpec.describe Apexcharts::RadarChart do
  let(:bindings) { nil }
  let(:data) {
    [[100, 1], [200, 2], [300, 3]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(bindings, data, options)
    expect(chart.chart_type).to eq('radar')
    expect(chart.more_options).to eq({})
    expect(chart.mixed_series).to eq(nil)
  end
end

