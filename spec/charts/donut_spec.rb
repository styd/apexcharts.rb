# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ApexCharts::DonutChart do
  let(:data) {
    [
      {name: 'Series A', data: 25},
      {name: 'Series B', data: 100},
      {name: 'Series C', data: 200},
      {name: 'Series D', data: 125}
    ]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(data, options)
    expect(chart.chart_type).to eq('donut')
  end
end
