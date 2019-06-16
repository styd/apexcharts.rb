require 'spec_helper'

RSpec.describe '#build_div' do
  let(:x_sample) { nil }
  let(:options) {
    {
      id: "the-div-id",
      var: "aVariableName",
      class: "the-div-class",
      style: "css-style"
    }
  }
  let(:built) { Apexcharts::OptionsBuilder.new(x_sample, options).built }
  let(:expected_built) {
    {
      div: {
        id: "the-div-id",
        var: "aVariableName",
        class: "the-div-class",
        style: "css-style"
      }
    }
  }

  it 'extract chart related key-values' do
    expect(built).to match(hash_including(expected_built))
  end
end


