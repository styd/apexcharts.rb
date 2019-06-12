require 'spec_helper'

RSpec.describe Apexcharts::ScatterChart do
  let(:data) {
    [[100, 1], [200, 2]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(data, options)
    expect(chart.chart_type).to eq('scatter')
    expect(chart.plot_options).to eq({})
    expect(chart.mixed_series).to eq(
      [
        {data: [
          {x: 100, y: 1},
          {x: 200, y: 2}
        ],
        type: 'scatter'}
      ]
    )
  end
end

