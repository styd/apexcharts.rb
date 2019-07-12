require 'spec_helper'

RSpec.describe Apexcharts::ColumnChart do
  let(:bindings) { nil }
  let(:data) {
    [[100, 1], [200, 2]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(bindings, data, options)
    expect(chart.chart_type).to eq('bar')
    expect(chart.more_options).to eq(
      {
        plot_options: {
          bar: {
            horizontal: false
          }
        }
      }
    )
    expect(chart.mixed_series).to eq(
      [
        {data: [
          {x: 100, y: 1},
          {x: 200, y: 2}
        ],
        type: 'bar'}
      ]
    )
  end

  it 'merged options and more_options correctly' do
    options = { plotOptions: { bar: { dataLabels: { position: "top" } } } }
    chart = described_class.new(bindings, data, options)

    expect(chart.instance_variable_get(:@options)[:plotOptions]).to eq(
      {
        bar: {
          dataLabels: {
            position: "top"
          },
          horizontal: false
        }
      }
    )
  end
end

