# frozen_string_literal: true

require_relative 'colors'

module ApexCharts
  class Theme
    PALETTES = %w[palette1 palette2 palette3 palette4 palette5
                  palette6 palette7 palette8 palette9 palette10].freeze

    @custom_palettes = {}

    module ClassMethods
      def create(palette_name, colors)
        palettes[palette_name] = Colors.new colors
      end

      def destroy(palette_name)
        palettes.delete palette_name
      end

      def get_colors(palette_name)
        custom_palettes[palette_name]&.values
      end

      def palette_names
        custom_palettes.keys
      end

      def all_palettes
        PALETTES + palette_names
      end

      def custom_palettes
        palettes
      end

      def palettes
        @custom_palettes
      end
    end

    extend ClassMethods
  end
end
