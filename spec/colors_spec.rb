require 'spec_helper'

RSpec.describe ApexCharts::Colors do
  context '#values' do
    context 'when input is a string' do
      context 'of a valid color' do
        it 'returns array of one color upcased' do
          colors = described_class.new("#aabbcc")
          expect(colors.values).to eq ["#AABBCC"]
        end
      end

      context 'of an invalid color' do
        it 'raises error' do
          expect { described_class.new("red") }.to raise_error /unrecognized color/
        end
      end
    end

    context 'when input is an array' do
      context 'with valid colors' do
        it 'returns array of colors upcased' do
          colors = described_class.new(["#aabbcc", "#BBAACC"])
          expect(colors.values).to eq ["#AABBCC", "#BBAACC"]
        end
      end

      context 'with an invalid color' do
        it 'raises error' do
          expect { described_class.new(["#AABBCC", "red"]) }.to raise_error /unrecognized color/
        end
      end
    end
  end
end
