# frozen_string_literal: true

require 'spec_helper'

DODummy = Class.new

RSpec.describe ApexCharts::DefaultOptions do
  let(:do_dummy) { DODummy.new }

  before do
    DODummy.include described_class
  end

  context '.default_options=' do
    let(:options) { {data_labels: false} }
    let(:expected_built) { {dataLabels: {enabled: false}} }

    it 'builds the options' do
      do_dummy.default_options = options
      expect(do_dummy.instance_variable_get(:@default_options)).to(
        eq expected_built
      )
    end
  end

  context '.default_options' do
    context 'when options not set' do
      it 'returns empty hash' do
        expect(do_dummy.default_options).to eq({})
      end
    end

    context 'when options is set' do
      it 'returns @default_options value' do
        do_dummy.default_options = {tooltip: true}
        expect(do_dummy.default_options).to(
          eq do_dummy.instance_variable_get(:@default_options)
        )
      end
    end
  end
end
