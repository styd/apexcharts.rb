# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'chart options' do
  let(:sample) { nil }
  let(:options) {
    {
      chart: {background: '#ddd', height: 350},
      id: 'an-html-element-id',
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
      }
    }
  }

  it 'extract chart related key-values' do
    ob.build_chart
    expect(ob.built).to match(expected_built)
  end

  context 'brush chart' do
    let(:options) {
      {
        brush_target: 'chart-1'
      }
    }
    let(:expected_built) {
      {
        chart: {
          brush: {
            enabled: true,
            target: 'chart-1'
          },
          height: 180,
          selection: {
            enabled: true
          }
        }
      }
    }

    it 'extract brush chart target' do
      ob.build_chart
      expect(ob.built).to match(expected_built)
    end
  end
end
