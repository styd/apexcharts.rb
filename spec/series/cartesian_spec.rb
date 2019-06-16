require 'spec_helper'

RSpec.describe Apexcharts::CartesianSeries do
  context 'when input is a raw data' do
    let(:data1) {
      [[100, 1], [200, 2]]
    }
    let(:data2) { data1.to_h }
    let(:data3) { {name: "Series A", data: data2} }
    let(:expected) {
      {
        series: [{
          data: [{x: 100, y: 1}, {x: 200, y: 2}]
        }]
      }
    }
    let(:expected_with_name) { 
      {
        series: [{
          name: "Series A",
          data: [{x: 100, y: 1}, {x: 200, y: 2}]
        }]
      }
    }

    it 'returns data in x and y keys' do
      expect(described_class.new(data1).sanitized).to eq(expected)
      expect(described_class.new(data2).sanitized).to eq(expected)
      expect(described_class.new(data3).sanitized).to eq(expected_with_name)
    end
  end

  context 'when input is the value of data key' do
    let(:data) {
      {
        data: [[100, 1], [200, 2]]
      }
    }
    let(:data2) {
      {
        name: "Series A",
        data: [[100, 1], [200, 2]]
      }
    }

    it 'returns data in x and y keys' do
      expect(described_class.new(data).sanitized).to eq(
        {
          series: [{
            data: [{x: 100, y: 1}, {x: 200, y: 2}]
          }]
        }
      )
      expect(described_class.new(data2).sanitized).to eq(
        {
          series: [{
            name: "Series A",
            data: [{x: 100, y: 1}, {x: 200, y: 2}]
          }]
        }
      )
    end
  end
end
