require 'spec_helper'

RSpec.describe '#build_div' do
  let(:x_sample) { nil }
  let(:options) {
    {
      id: 'the-div-id',
      var: 'aVariableName',
      class: 'the-div-class',
      style: 'css-style'
    }
  }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(x_sample, options)
  }
  let(:expected_built) {
    {
      div: {
        id: 'the-div-id',
        var: 'aVariableName',
        class: 'the-div-class',
        style: 'css-style'
      }
    }
  }

  it 'extract div related key-values' do
    ob.build_div
    expect(ob.built).to match(hash_including(expected_built))
  end
end
