# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'states options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'string normal, hover, and active' do
    let(:options) {
      {
        normal: 'lighten',
        hover: 'none',
        active: 'darken'
      }
    }
    let(:expected_built) {
      {
        states: {
          normal: {
            filter: {
              type: 'lighten'
            }
          },
          hover: {
            filter: {
              type: 'none'
            }
          },
          active: {
            filter: {
              type: 'darken'
            }
          }
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_states
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash states' do
    let(:options) {
      {
        states: {
          active: {
            allow_multiple_data_points_selection: true,
            filter: {
              type: 'lighten',
              value: 0.3
            }
          }
        }
      }
    }
    let(:expected_built) {
      {
        states: {
          active: {
            allowMultipleDataPointsSelection: true,
            filter: {
              type: 'lighten',
              value: 0.3
            }
          }
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_states
      expect(ob.built).to match(expected_built)
    end
  end
end

RSpec.describe '#build_states' do
  after do
    ApexCharts.config.schema = :default
  end

  context 'schema dry_schema' do
    it_behaves_like 'states options' do
      before do
        ApexCharts.config.schema = :dry_schema
      end
    end
  end

  context 'schema smart_kv' do
    it_behaves_like 'states options' do
      before do
        ApexCharts.config.schema = :default
      end
    end
  end
end
