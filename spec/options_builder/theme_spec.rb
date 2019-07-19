require 'spec_helper'

RSpec.describe '#build_theme' do
  let(:x_sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(x_sample, options)
  }

  context "string theme" do
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
        allow(ApexCharts::OptionsBuilder::THEME_PALETTES).to(
          receive(:sample).and_return('palette4')
        )
      end

      it 'adds shape key with the string as the value' do
        ob.build_theme
        expect(ob.built).to match(hash_including(expected_built))
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

      it 'adds shape key with the string as the value' do
        ob.build_theme
        expect(ob.built).to match(hash_including(expected_built))
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
          theme: {
            palette: 'apexcharts'
          }
        }
      }

      it 'adds shape key with the string as the value' do
        ob.build_theme
        expect(ob.built).to match(hash_including(expected_built))
      end
    end
  end

  context "hash theme" do
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
      expect(ob.built).to match(hash_including(expected_built))
    end
  end
end


