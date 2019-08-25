require 'spec_helper'

RSpec.describe '#build_annotations' do
  let(:x_sample) { nil }
  let(:options) {
    {
      annotations: {
        yaxis: [
          {
            y: 8200,
            border_color: '#00E396',
            label: {
              border_color: '#00E396',
              style: {
                color: '#fff',
                background: '#00E396'
              },
              text: 'Support'
            }
          }
        ]
      }
    }
  }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(x_sample, options)
  }
  let(:expected_built) {
    {
      annotations: {
        yaxis: [
          {
            y: 8200,
            borderColor: '#00E396',
            label: {
              borderColor: '#00E396',
              style: {
                color: '#fff',
                background: '#00E396'
              },
              text: 'Support'
            }
          }
        ]
      }
    }
  }

  it 'only camelizes the hash keys' do
    ob.build_annotations
    expect(ob.built).to match(hash_including(expected_built))
  end
end
