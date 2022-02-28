# frozen_string_literal: true

require 'spec_helper'
require 'nokogiri'

RSpec.describe ApexCharts::Renderer do
  let(:options) {
    {
      chart: {
        height: 400
      },
      div: {
        class: 'css-class'
      },
      dataLabels: {
        formatter: {
          function: {
            args: 'value',
            body: 'return value + " rabbits";'
          }
        }
      }
    }
  }

  context '.render' do
    it 'renders div and script elements' do
      html = described_class.render(options)
      parsed = Nokogiri::HTML.parse(html)

      expect(parsed).not_to be_blank
      expect(parsed.css('div.css-class')).not_to be_empty

      script = parsed.css('script')
      expect(script).not_to be_empty
      expect(script.attr('apexcharts-rb').value).to eq ApexCharts::RELEASE

      expect(parsed.at("script:contains('function(value){return value + \" rabbits\"')")).not_to \
        be_nil
    end
  end

  context '.render when defer = true' do
    it 'renders div and script elements' do
      html = described_class.render(options.merge({defer: true}))

      expect(html).to include 'var createChart = function()'
      expect(html).to include 'window.addEventListener'
    end
  end

  context '.render when module = true' do
    it 'renders div and script elements' do
      html = described_class.render(options.merge({module: true}))

      expect(html).to include 'type="module"'
    end
  end
end
