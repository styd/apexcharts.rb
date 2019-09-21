require 'spec_helper'

RSpec.describe ApexCharts::BarChart do
  let(:outer_self) { nil }
  let(:data) {
    [[100, 1], [200, 2]]
  }
  let(:options) { {} }
  let(:chart) {
    described_class.new(outer_self, data, options)
  }

  it 'assigned properties correctly' do
    expect(chart.chart_type).to eq('bar')
    expect(chart.more_options).to eq(
      plot_options: {
        bar: {
          horizontal: true
        }
      }
    )
    expect(chart.mixed_series).to eq(
      [
        {
          data: [
            {x: 100, y: 1},
            {x: 200, y: 2}
          ],
          type: 'bar'
        }
      ]
    )
  end

  context 'when options specifed is intertwined with more options' do
    let(:options) {
      {
        plot_options: {
          bar: {
            data_labels: {
              position: 'top'
            }
          }
        }
      }
    }

    it 'merged options and more_options correctly' do
      expect(chart.options[:plotOptions]).to eq(
        bar: {
          dataLabels: {
            position: 'top'
          },
          horizontal: true
        }
      )
    end
  end
end
