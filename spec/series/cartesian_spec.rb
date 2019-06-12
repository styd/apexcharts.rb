require 'spec_helper'

RSpec.describe Apexcharts::CartesianSeries do
  context 'when input is a raw data' do
    let(:data1) {
      [[100, 1], [200, 2]]
    }
    let(:data2) { data1.to_h }
    let(:expected) { 
      [{
        data: [{x: 100, y: 1}, {x: 200, y: 2}]
      }]
    }

    it 'returns data in x and y keys' do
      expect(described_class.new(data1).sanitized).to eq(expected)
      expect(described_class.new(data2).sanitized).to eq(expected)
    end
  end

  context 'when input is the value of data key' do
    let(:data) {
      {
        data: [[100, 1], [200, 2]]
      }
    }

    it 'returns data in x and y keys' do
      expect(described_class.new(data).sanitized).to eq(
        [{
          data: [{x: 100, y: 1}, {x: 200, y: 2}]
        }]
      )
    end
  end
end
