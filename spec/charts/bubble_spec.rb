require 'spec_helper'

RSpec.describe Apexcharts::BubbleChart do
  let(:data) {
    [[100, 1, 2], [200, 2, 3]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(data, options)
    expect(chart.chart_type).to eq('bubble')
  end
end

