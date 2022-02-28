# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ApexCharts::Charts::BoxPlotChart do
  let(:outer_self) { nil }
  let(:data) {
    [['label_1', [10, 20, 30, 40, 50]], ['label_2', [30, 40, 50, 60, 70]]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(outer_self, data, options)
    expect(chart.chart_type).to eq('boxPlot')
    expect(chart.more_options).to eq({})
    expect(chart.mixed_series).to eq(
      [
        {
          data: [
            {x: 'label_1', y: [10, 20, 30, 40, 50]},
            {x: 'label_2', y: [30, 40, 50, 60, 70]}
          ],
          type: 'boxPlot'
        }
      ]
    )
  end
end
