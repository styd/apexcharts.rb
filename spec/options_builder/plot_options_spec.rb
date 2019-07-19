require 'spec_helper'

RSpec.describe '#build_plot_options' do
  let(:x_sample) { nil }
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
    ApexCharts::OptionsBuilder.new(x_sample, plot_options)
  }

  it 'camelizes the hash' do
    hash_ob.build_plot_options
    expect(hash_ob.built).to match(hash_including(expected_plot_options_built))
  end
end


