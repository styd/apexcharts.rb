require 'spec_helper'

RSpec.describe '#build_grid' do
  let(:x_sample) { nil }
  let(:ob) {
    Apexcharts::OptionsBuilder.new(x_sample, options)
  }

  context "boolean grid" do
    let(:options) {
      {
        grid: true
      }
    }
    let(:expected_built) {
      {
        grid: {
          show: true
        }
      }
    }

    it 'adds show key with the boolean as the value' do
      ob.build_grid
      expect(ob.built).to match(hash_including(expected_built))
    end
  end

  context "hash grid" do
    let(:options) {
      {
        grid: {
          show: true,
          border_color: 'blue',
          position: 'front'
        }
      }
    }
    let(:expected_built) {
      {
        grid: {
          show: true,
          borderColor: 'blue',
          position: 'front'
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_grid
      expect(ob.built).to match(hash_including(expected_built))
    end
  end
end


