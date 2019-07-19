require 'spec_helper'

RSpec.describe '#build_xaxis' do
  let(:x_sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(x_sample, options)
  }

  context 'xaxis is a string' do
    let(:options) {
      {
        xtype: "number",
        xtitle: "X-Title",
        xaxis: "Title"
      }
    }
    let(:expected_built) {
      {
        xaxis: {
          type: "number",
          title: {
            text: "Title"
          }
        }
      }
    }

    it 'choose xaxis string value over xtitle for the title' do
      ob.build_xaxis
      expect(ob.built).to match(hash_including(expected_built))
    end
  end

  context 'xaxis is a hash' do
    let(:options) {
      {
        xtype: "number",
        xtitle: "X-Title",
        xaxis: {
          position: "top",
          type: "datetime"
        }
      }
    }
    let(:expected_built) {
      {
        xaxis: {
          type: "datetime",
          title: {
            text: "X-Title",
          },
          position: "top"
        }
      }
    }

    it 'choose type in xaxis over xtype' do
      ob.build_xaxis
      expect(ob.built).to match(hash_including(expected_built))
    end
  end

  context 'x_sample is a time' do
    let(:x_sample) { Time.now }
    let(:options) {
      {
        xtype: "number",
      }
    }
    let(:expected_built) {
      {
        xaxis: {
          type: "number",
        }
      }
    }

    it 'will disregard x_sample' do
      ob.build_xaxis
      expect(ob.built).to match(hash_including(expected_built))
    end
  end
end


