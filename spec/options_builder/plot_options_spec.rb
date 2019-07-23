# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'plot options' do
  let(:sample) { nil }
  let(:plot_options) {
    {
      plot_options: {
        bar: {
          horizontal: false,
          column_width: '50%',
          data_labels: {
            position: 'bottom'
          }
        }
      }
    }
  }
  let(:expected_plot_options_built) {
    {
      plotOptions: {
        bar: {
          horizontal: false,
          columnWidth: '50%',
          dataLabels: {
            position: 'bottom'
          }
        }
      }
    }
  }
  let(:hash_ob) {
    ApexCharts::OptionsBuilder.new(sample, plot_options)
  }

  it 'camelizes the hash' do
    hash_ob.build_plot_options
    expect(hash_ob.built).to match(expected_plot_options_built)
  end
end

RSpec.describe '#build_plot_options' do
  after do
    ApexCharts.config.schema = :default
  end

  context 'schema dry_schema' do
    it_behaves_like 'plot options' do
      before do
        ApexCharts.config.schema = :dry_schema
      end
    end
  end

  context 'schema smart_kv' do
    it_behaves_like 'plot options' do
      before do
        ApexCharts.config.schema = :default
      end
    end
  end
end
