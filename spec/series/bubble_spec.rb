require 'spec_helper'

RSpec.describe ApexCharts::BubbleSeries do
  let(:data1) {
    [[707, 18, 0],
     [640, 37, 43],
     [548, 55, 19],
     [129, 22, 26],
     [365, 26, 54],
     [543, 59, 38],
     [570, 27, 54],
     [506, 51, 28],
     [137, 60, 5],
     [107, 59, 50],
     [179, 51, 67],
     [444, 26, 49],
     [70, 58, 48],
     [42, 11, 43],
     [581, 19, 23],
     [129, 34, 11],
     [138, 10, 64],
     [193, 27, 43],
     [635, 10, 43],
     [612, 12, 23]]
  }
  let(:data2) {
    {
      data: data1
    }
  }
  let(:expected1) {
    {
      series: [{
        data: data1
      }]
    }
  }
  let(:data3) {
    [[102, 23, 15],
     [20, 52, 24],
     [20, 32, 27],
     [329, 55, 33],
     [713, 44, 21],
     [473, 39, 52],
     [170, 59, 35],
     [162, 30, 13],
     [560, 32, 48],
     [110, 11, 45],
     [602, 36, 69],
     [618, 53, 8],
     [19, 43, 42],
     [151, 17, 48],
     [613, 22, 30],
     [26, 47, 62],
     [237, 12, 36],
     [689, 51, 44],
     [701, 50, 34],
     [592, 59, 66]]
  }
  let(:data4) {
    [
      {
        name: 'Series A',
        data: data1
      },
      {
        name: 'Series B',
        data: data3
      }
    ]
  }
  let(:expected2) {
    {
      series: [
                {
                  name: 'Series A',
                  data: data1
                },
                {
                  name: 'Series B',
                  data: data3
                }
              ]
    }
  }

  it 'returns as expected' do
    expect(described_class.new(data1).sanitized).to eq(expected1)
    expect(described_class.new(data2).sanitized).to eq(expected1)
    expect(described_class.new(data4).sanitized).to eq(expected2)
  end
end
