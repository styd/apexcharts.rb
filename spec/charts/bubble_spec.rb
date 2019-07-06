require 'spec_helper'

RSpec.describe Apexcharts::BubbleChart do
  let(:bindings) { nil }
  let(:data) {
    [[100, 1, 2], [200, 2, 3]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(bindings, data, options)
    expect(chart.chart_type).to eq('bubble')
    expect(chart.more_options).to eq({})
    expect(chart.mixed_series).to eq(nil)
  end
end

