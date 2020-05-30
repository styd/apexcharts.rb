# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ApexCharts::Charts::MixedCharts do
  let(:line_data) {
    [[100, 1], [200, 2]]
  }
  let(:area_data) {
    [[200, 2], [300, 3]]
  }
  let(:more_options) { {} }
  let(:options) { {} }
  let(:expected_series) {
    {
      series: [
        {
          data: [
            {x: 100, y: 1},
            {x: 200, y: 2}
          ],
          type: 'line'
        },
        {
          data: [
            {x: 200, y: 2},
            {x: 300, y: 3}
          ],
          type: 'area'
        }
      ]
    }
  }

  it 'assigned properties correctly' do
    outer_self = binding
    %i[apexcharts_id line_data area_data more_options].each do |m|
      outer_self.define_singleton_method m, &method(m)
    end

    chart = described_class.new(outer_self, options) do
      line_chart(line_data)
      area_chart(area_data)
    end
    expect(chart.chart_type).to eq('area')
    expect(chart.more_options).to eq({})
    expect(chart.instance_variable_get(:@series)).to eq(expected_series)
    expect(chart.instance_variable_get(:@options)).to eq(
      chart: {
        height: 400, id: 'chart-1', type: 'area'
      },
      defer: false,
      div: {id: 'chart-1'},
      **expected_series
    )
  end
end
