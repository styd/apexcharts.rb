require 'spec_helper'

RSpec.describe ApexCharts::CartesianChart do
  let(:outer_self) { nil }
  let(:data) {
    [[100, 1], [200, 2]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(outer_self, data, options)
    expect(chart.chart_type).to eq(nil)
    expect(chart.more_options).to eq({})
  end

  context 'when the series is empty' do
    let(:data) { [] }

    it 'assigned properties correctly' do
      chart = described_class.new(outer_self, data, options)
      expect(chart.chart_type).to eq(nil)
      expect(chart.more_options).to eq({})
    end
  end
end
