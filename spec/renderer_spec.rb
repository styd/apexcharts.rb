# frozen_string_literal: true

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

    context 'when global options are set' do
      let(:default_options) { { tootip: true } }

      before do
        allow(ApexCharts.config)
          .to receive(:default_options)
          .and_return(default_options)
      end

      it 'renders a script with window.Apex initialization ' \
         'before rendering first chart' do
        html = described_class.render(options.merge(div: {id: 'chart-1'}))
        parsed = Nokogiri::HTML.parse(html)
        script = parsed.css('script')

        expect(script).not_to be_empty

        expect(script.text)
          .to include("window.Apex = #{default_options.to_json}")
      end
    end

    context 'when defer = true' do
      it 'renders div and script elements' do
        html = described_class.render(options.merge({defer: true}))

        expect(html).to include 'var createChart = function()'
        expect(html).to include 'window.addEventListener'
      end

      it 'includes Turbo and Turbolinks event integration' do
        html = described_class.render(options.merge({defer: true}))

        expect(html).to include 'turbo:load'
        expect(html).to include 'turbo:before-render'
        expect(html).to include 'turbolinks:load'
        expect(html).to include 'turbolinks:before-render'
      end
    end

    context 'when module = true' do
      it 'renders div and script elements' do
        html = described_class.render(options.merge({module: true}))

        expect(html).to include 'type="module"'
      end
    end
  end
end
