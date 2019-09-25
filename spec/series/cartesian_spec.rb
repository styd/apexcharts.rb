require 'spec_helper'

RSpec.describe ApexCharts::CartesianSeries do
  let(:data1) {
    [[100, 1], [200, 2]]
  }
  let(:data2) { data1.to_h }
  let(:expected1) {
    {
      series: [{
        data: [{x: 100, y: 1}, {x: 200, y: 2}]
      }]
    }
  }
  let(:data3) { # with same x
    [[200, 1], [200, 2]]
  }
  let(:expected2) {
    {
      series: [{
        data: [{x: 200, y: 1}, {x: 200, y: 2}]
      }]
    }
  }

  let(:data4) {
    {
      data: [[100, 1], [200, 2]]
    }
  }
  let(:expected3) {
    {
      series: [{
        data: [{x: 100, y: 1}, {x: 200, y: 2}]
      }]
    }
  }
  let(:data5) {
    [
      {
        data: [[100, 1], [200, 2]]
      },
      {
        data: [[200, 3], [300, 5]]
      }
    ]
  }
  let(:expected4) {
    {
      series: [
        {
          data: [{x: 100, y: 1}, {x: 200, y: 2}]
        },
        {
          data: [{x: 200, y: 3}, {x: 300, y: 5}]
        }
      ]
    }
  }
  let(:data6) {
    [
      {
        name: 'Series A',
        data: [[100, 1], [200, 2]]
      },
      {
        name: 'Series B',
        data: [[400, 3], [400, 5]]
      }
    ]
  }
  let(:expected5) {
    {
      series: [
        {
          name: 'Series A',
          data: [{x: 100, y: 1}, {x: 200, y: 2}]
        },
        {
          name: 'Series B',
          data: [{x: 400, y: 3}, {x: 400, y: 5}]
        }
      ]
    }
  }
  let(:data7) { [] }
  let(:expected6) { {series: []} }
  let(:data8) { [{name: 'A', data: []}] }
  let(:expected7) { {series: [{name: 'A', data: []}]} }

  it 'returns as expected' do
    expect(described_class.new(data1).sanitized).to eq(expected1)
    expect(described_class.new(data2).sanitized).to eq(expected1)
    expect(described_class.new(data3).sanitized).to eq(expected2)
    expect(described_class.new(data4).sanitized).to eq(expected3)
    expect(described_class.new(data5).sanitized).to eq(expected4)
    expect(described_class.new(data6).sanitized).to eq(expected5)
    expect(described_class.new(data7).sanitized).to eq(expected6)
    expect(described_class.new(data8).sanitized).to eq(expected7)
  end

  context 'sample' do
    it 'returns correct sample' do
      expect(described_class.new(data1).sample).to eq(100)
      expect(described_class.new(data2).sample).to eq(100)
      expect(described_class.new(data3).sample).to eq(200)
      expect(described_class.new(data4).sample).to eq(100)
      expect(described_class.new(data5).sample).to eq(100)
      expect(described_class.new(data6).sample).to eq(100)
      expect(described_class.new(data7).sample).to be_nil
      expect(described_class.new(data8).sample).to be_nil
    end
  end
end
