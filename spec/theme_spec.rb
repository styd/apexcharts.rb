require 'spec_helper'

describe ApexCharts::Theme do
  context '::PALETTES' do
    it 'has 10 palettes' do
      expect(described_class::PALETTES.size).to eq 10
    end
  end

  context '.create' do
    it 'creates a new palette' do
      described_class.create "my_palette", ["#aabbcc", "#bbccdd"]

      expect(described_class.custom_palettes).to eq ["my_palette"]
      expect(described_class.get_colors("my_palette")).to eq ["#AABBCC", "#BBCCDD"]
    end

    it 'replaces existing palette' do
      described_class.create "my_palette", ["#aabbcc", "#bbccdd"]

      expect(described_class.get_colors("my_palette")).to eq ["#AABBCC", "#BBCCDD"]

      described_class.create "my_palette", ["#aabbcc", "#bbccdd", "#ccddee"]

      expect(described_class.get_colors("my_palette")).to eq ["#AABBCC", "#BBCCDD", "#CCDDEE"]
    end
  end

  context '.destroy' do
    it 'destroys existing colors' do
      described_class.create "my_palette", ["#aabbcc", "#bbccdd"]

      expect(described_class.get_colors("my_palette")).to eq ["#AABBCC", "#BBCCDD"]

      described_class.destroy "my_palette"

      expect(described_class.get_colors("my_palette")).to eq nil

      described_class.destroy "my_palette"

      expect(described_class.get_colors("my_palette")).to eq nil
    end
  end

  context '.all_palettes' do
    it 'returns all palette' do
      expect(described_class.all_palettes.size).to eq 10

      described_class.create "my_palette", ["#aabbcc", "#bbccdd"]

      expect(described_class.all_palettes.size).to eq 11
      expect(described_class.all_palettes).to include 'my_palette'

      described_class.create "my_palette", ["#aabbcc", "#bbccdd", "#ccddee"]

      expect(described_class.all_palettes.size).to eq 11
      expect(described_class.all_palettes).to include 'my_palette'
    end
  end
end
