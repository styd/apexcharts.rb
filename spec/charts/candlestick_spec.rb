require 'spec_helper'

RSpec.describe ApexCharts::CandlestickChart do
  let(:bindings) { nil }
  let(:data) {
    [[100, 1], [200, 2]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(bindings, data, options)
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
