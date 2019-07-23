# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'markers options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'string markers' do
    let(:options) {
      {
        markers: 'square'
      }
    }
    let(:expected_built) {
      {
        markers: {
          shape: 'square'
        }
      }
    }

    it 'adds shape key with the string as the value' do
      ob.build_markers
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash markers' do
    let(:options) {
      {
        markers: {
          size: 4,
          stroke_width: 2,
          radius: 3,
          hover: {
            size: 5
          }
        }
      }
    }
    let(:expected_built) {
      {
        markers: {
          size: 4,
          strokeWidth: 2,
          radius: 3,
          hover: {
            size: 5
          }
        }
      }
    }
    it 'only camelizes the hash' do
      ob.build_markers
      expect(ob.built).to match(expected_built)
    end
  end
end

RSpec.describe '#build_markers' do
  after do
    ApexCharts.config.schema = :default
  end

  context 'schema dry_schema' do
    it_behaves_like 'markers options' do
      before do
        ApexCharts.config.schema = :dry_schema
      end
    end
  end

  context 'schema smart_kv' do
    it_behaves_like 'markers options' do
      before do
        ApexCharts.config.schema = :default
      end
    end
  end
end
