# frozen_string_literal: true

RSpec.describe ApexCharts::Charts::CartesianChart do
  let(:outer_self) { nil }
  let(:data) {
    [[100, 1], [200, 2]]
  }
  let(:options) { {} }

  it 'assigned properties correctly' do
    chart = described_class.new(outer_self, data, options)
    expect(chart.series_type).to eq(ApexCharts::Series::CartesianSeries)
    expect(chart.more_options).to eq({})
  end
end
