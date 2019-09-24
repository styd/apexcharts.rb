require 'spec_helper'

RSpec.describe ApexCharts::ScatterChart do
  let(:outer_self) { nil }
  let(:data) {
    [[100, 1], [200, 2]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(outer_self, data, options)
    expect(chart.chart_type).to eq('scatter')
    expect(chart.more_options).to eq({})
    expect(chart.mixed_series).to eq(
      [
        {
          data: [
            {x: 100, y: 1},
            {x: 200, y: 2}
          ],
          type: 'scatter'
        }
      ]
    )
  end

  context 'when the series is empty' do
    let(:data) { [] }

    it 'assigned properties correctly' do
      chart = described_class.new(outer_self, data, options)
      expect(chart.chart_type).to eq('scatter')
      expect(chart.more_options).to eq({})
      expect(chart.mixed_series).to eq([])
    end
  end

  context 'when a hash series is empty' do
    let(:data) {
      [
        {
          name: 'series',
          data: []
        }
      ]
    }

    it 'assigned properties correctly' do
      chart = described_class.new(outer_self, data, options)
      expect(chart.chart_type).to eq('scatter')
      expect(chart.more_options).to eq({})
      expect(chart.mixed_series).to eq(
        [
          {
            data: [],
            name: 'series',
            type: 'scatter'
          }
        ]
      )
    end
  end
end
