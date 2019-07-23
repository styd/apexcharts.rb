# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'tooltip options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'boolean tooltip' do
    let(:options) {
      {
        tooltip: true
      }
    }
    let(:expected_built) {
      {
        tooltip: {
          enabled: true
        }
      }
    }

    it 'adds show key with the boolean as the value' do
      ob.build_tooltip
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash tooltip' do
    let(:options) {
      {
        tooltip: {
          shared: false,
          follow_cursor: true
        }
      }
    }
    let(:expected_built) {
      {
        tooltip: {
          shared: false,
          followCursor: true
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_tooltip
      expect(ob.built).to match(expected_built)
    end
  end
end

RSpec.describe '#build_tooltip' do
  after do
    ApexCharts.config.schema = :default
  end

  context 'schema dry_schema' do
    it_behaves_like 'tooltip options' do
      before do
        ApexCharts.config.schema = :dry_schema
      end
    end
  end

  context 'schema smart_kv' do
    it_behaves_like 'tooltip options' do
      before do
        ApexCharts.config.schema = :default
      end
    end
  end
end
