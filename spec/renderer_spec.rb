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
            args: "value",
            body: 'return value + " rabbits";'
          }
        }
      }
    }
  }

  context '.render_default' do
    it 'renders div and script elements' do
      html = described_class.render_default(options)
      parsed = Nokogiri::HTML.parse(html)

      expect(parsed).not_to be_blank
      expect(parsed.css('div.css-class')).not_to be_empty
      expect(parsed.css('script')).not_to be_empty
      expect(parsed.at("script:contains('function(value){return value + \" rabbits\"')")).not_to \
        be_nil
    end
  end
end
