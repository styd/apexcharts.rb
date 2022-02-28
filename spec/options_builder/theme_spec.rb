# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'theme options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'string theme' do
    context 'when random' do
      let(:options) {
        {
          theme: 'random'
        }
      }
      let(:expected_built) {
        {
          theme: {
            palette: 'palette4'
          }
        }
      }

      before do
        allow(ApexCharts::Theme).to(
          receive(:all_palettes).and_return(['palette4'])
        )
      end

      it 'adds theme value as palette' do
        ob.build_theme
        expect(ob.built).to match(expected_built)
      end
    end

    context 'when monochrome' do
      let(:options) {
        {
          theme: 'monochrome'
        }
      }
      let(:expected_built) {
        {
          theme: {
            monochrome: {enabled: true}
          }
        }
      }

      it 'adds monochrome as enabled' do
        ob.build_theme
        expect(ob.built).to match(expected_built)
      end
    end

    context 'when a custom palette' do
      let(:options) {
        {
          theme: 'my_palette'
        }
      }
      let(:expected_built) {
        {
          theme: nil,
          colors: ApexCharts::Theme.get_colors('my_palette')
        }
      }

      it 'builds the colors instead' do
        ApexCharts::Theme.create 'my_palette', ['#aabbcc', '#bbccdd']

        ob.build_theme
        expect(ob.built).to match(expected_built)
      end
    end

    context 'when anything else' do
      let(:options) {
        {
          theme: 'apexcharts'
        }
      }
      let(:expected_built) {
        {
          theme: nil
        }
      }

      it 'adds theme value as palette' do
        ob.build_theme
        expect(ob.built).to match(expected_built)
      end
    end
  end

  context 'hash theme' do
    let(:options) {
      {
        theme: {
          monochrome: {
            enabled: true,
            shade_to: 'dark'
          }
        }
      }
    }
    let(:expected_built) {
      {
        theme: {
          monochrome: {
            enabled: true,
            shadeTo: 'dark'
          }
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_theme
      expect(ob.built).to match(expected_built)
    end
  end
end
