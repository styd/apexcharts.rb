require 'spec_helper'

RSpec.describe '#build_chart' do
  let(:x_sample) { nil }
  let(:options) {
    {
      chart: {background: "#ddd", height: 350},
      id: "an-html-element-id",
      chart_id: "a-chart-id",
      group: "group-name",
      height: 300,
      width: 400,
      stacked: true,
      animations: true,
      sparkline: true,
      background: '#ccc',
      fore_color: '#fc9'
    }
  }
  let(:built) { Apexcharts::OptionsBuilder.new(x_sample, options).built }
  let(:expected_built) {
    {
      chart: {
        id: "a-chart-id",
        animations: {enabled: true},
        background: "#ddd",
        fore_color: "#fc9",
        group: "group-name",
        height: 350,
        width: 400,
        sparkline: {enabled: true},
        stacked: true
      }
    }
  }

  it 'extract chart related key-values' do
    expect(built).to match(hash_including(expected_built))
  end
end


