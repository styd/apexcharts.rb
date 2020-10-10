# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'fill options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'string fill' do
    let(:options) {
      {
        fill: 'gradient'
      }
    }
    let(:expected_built) {
      {
        fill: {
          type: 'gradient'
        }
      }
    }

    it 'adds type key with the string as the value' do
      ob.build_fill
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash fill' do
    let(:options) {
      {
        fill: {
          type: 'gradient',
          gradient: {
            shade: 'dark',
            type: 'horizontal'
          }
        }
      }
    }

    it 'keeps the hash intact' do
      ob.build_fill
      expect(ob.built).to match(options)
    end
  end
end

RSpec.describe '#build_fill' do
  after do
    ApexCharts.config.schema = :default
  end

  context 'schema dry_schema' do
    it_behaves_like 'fill options' do
      before do
        ApexCharts.config.schema = :dry_schema
      end
    end
  end

  context 'schema smart_kv' do
    it_behaves_like 'fill options' do
      before do
        ApexCharts.config.schema = :default
      end
    end
  end
end
