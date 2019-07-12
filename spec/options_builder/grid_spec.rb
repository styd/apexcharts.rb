require 'spec_helper'

RSpec.describe '#build_grid' do
  let(:x_sample) { nil }
  let(:boolean_grid) {
    {
      grid: true
    }
  }
  let(:hash_grid) {
    {
      grid: {
        show: true,
        border_color: 'blue',
        position: 'front'
      }
    }
  }
  let(:boolean_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, boolean_grid)
  }
  let(:hash_ob) {
    Apexcharts::OptionsBuilder.new(x_sample, hash_grid)
  }
  let(:expected_boolean_built) {
    {
      grid: {
        show: true
      }
    }
  }
  let(:expected_hash_built) {
    {
      grid: {
        show: true,
        borderColor: 'blue',
        position: 'front'
      }
    }
  }

  context "boolean grid" do
    it 'adds show key with the boolean as the value' do
      boolean_ob.build_grid
      expect(boolean_ob.built).to match(hash_including(expected_boolean_built))
    end
  end

  context "hash grid" do
    it 'only camelizes the hash' do
      hash_ob.build_grid
      expect(hash_ob.built).to match(hash_including(expected_hash_built))
    end
  end
end


