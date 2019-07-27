# frozen_string_literal: true

require_relative 'colors'

module ApexCharts
  class Theme
    PALETTES = ["palette1", "palette2", "palette3", "palette4", "palette5", 
                "palette6", "palette7", "palette8", "palette9", "palette10"]

    @custom_palettes = {}

    class << self
      def create palette_name, colors
        @custom_palettes[palette_name] = Colors.new colors
      end

      def destroy palette_name
        @custom_palettes.delete palette_name
      end

      def get_colors(palette_name)
        @custom_palettes[palette_name]&.values
      end

      def custom_palettes
        @custom_palettes.keys
      end

      def all_palettes
        PALETTES + custom_palettes
      end
    end
  end
end

