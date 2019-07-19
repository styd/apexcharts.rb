require 'spec_helper'

RSpec.describe '#build_labels' do
  let(:x_sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(x_sample, options)
  }

  context "labels is nil" do
    let(:options) {
      {
        labels: nil
      }
    }
    let(:expected_built) {
      {
        labels: nil
      }
    }

    it 'return labels with nil value' do
      ob.build_labels
      expect(ob.built).to match(hash_including(expected_built))
    end
  end

  context "labels is array" do
    let(:options) {
      {
        labels: ['Apples', 'Oranges']
      }
    }
    let(:expected_built) {
      {
        labels: ['Apples', 'Oranges']
      }
    }

    it 'return labels with array value' do
      ob.build_labels
      expect(ob.built).to match(hash_including(expected_built))
    end
  end

  context "labels is anything else" do
    let(:options) {
      {
        labels: 'Apples'
      }
    }
    let(:expected_built) {
      {
        labels: ['Apples']
      }
    }

    it 'return labels with array value' do
      ob.build_labels
      expect(ob.built).to match(hash_including(expected_built))
    end
  end
end


