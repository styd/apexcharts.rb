# frozen_string_literal: true

RSpec.describe ApexCharts::Charts::CandlestickChart do
  let(:outer_self) { nil }
  let(:data) {
    [[100, 1], [200, 2]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(outer_self, data, options)
    expect(chart.chart_type).to eq('candlestick')
    expect(chart.more_options).to eq({})
    expect(chart.mixed_series).to eq(
      [
        {
          data: [
            {x: 100, y: 1},
            {x: 200, y: 2}
          ],
          type: 'candlestick'
        }
      ]
    )
  end
end
