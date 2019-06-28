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
  let(:hash_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, plot_options)
  }

  it 'keeps the value intact' do
    hash_ob.build_plot_options
    expect(hash_ob.built).to match(hash_including(plot_options))
  end
end


