# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'yaxis options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'yaxis is a string' do
    let(:options) {
      {
        ytype: 'numeric',
        ytitle: 'Y-Title',
        yaxis: 'Title'
      }
    }
    let(:expected_built) {
      {
        yaxis: [{
          type: 'numeric',
          title: {
            text: 'Title'
          }
        }]
      }
    }

    it 'choose yaxis string value over ytitle for the title' do
      ob.build_yaxis
      expect(ob.built).to match(expected_built)
    end
  end

  context 'yaxis is a hash' do
    let(:options) {
      {
        ytype: 'numeric',
        ytitle: 'Y-Title',
        yaxis: {
          type: 'datetime'
        }
      }
    }
    let(:expected_built) {
      {
        yaxis: [{
          type: 'datetime',
          title: {
            text: 'Y-Title'
          }
        }]
      }
    }

    it 'choose type in yaxis over ytype' do
      ob.build_yaxis
      expect(ob.built).to match(expected_built)
    end
  end

  context 'yaxis is empty' do
    let(:options) { {} }
    let(:expected_built) { {yaxis: nil} }

    it 'returns nil value' do
      ob.build_yaxis
      expect(ob.built).to match(expected_built)
    end
  end
end

RSpec.describe '#build_yaxis' do
  after do
    ApexCharts.config.schema = :default
  end

  context 'schema dry_schema' do
    it_behaves_like 'yaxis options' do
      before do
        ApexCharts.config.schema = :dry_schema
      end
    end
  end

  context 'schema smart_kv' do
    it_behaves_like 'yaxis options' do
      before do
        ApexCharts.config.schema = :default
      end
    end
  end
end
