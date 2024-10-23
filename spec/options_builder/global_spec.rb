# frozen_string_literal: true

RSpec.describe '#build_global_options' do
  let(:sample) { nil }
  let(:options) {
    {
      chart: {background: '#ddd', height: 350},
      id: 'an-html-element-id',
      var: 'aVariableName',
      class: 'the-div-class',
      style: 'css-style',
      chart_id: 'a-chart-id',
      group: 'group-name',
      height: 300,
      width: 400,
      stacked: true,
      animations: true,
      sparkline: true,
      background: '#ccc',
      fore_color: '#fc9'
    }
  }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }
  let(:expected_built) {
    {
      chart: {
        id: 'a-chart-id',
        animations: {enabled: true},
        background: '#ddd',
        foreColor: '#fc9',
        group: 'group-name',
        height: 350,
        width: 400,
        sparkline: {enabled: true},
        stacked: true
      },
      defer: false,
      module: false
    }
  }

  it 'exclude div related key-values' do
    ob.build_global_options
    expect(ob.built).to match(expected_built)
  end
end
