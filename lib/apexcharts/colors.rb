# frozen_string_literal: true

require 'set'

module ApexCharts
  class Colors
    def initialize colors
      @color_set = Set.new(clean(colors))
    end

    def values
      @color_set.to_a
    end

  private

    def clean colors
      colors = colors.respond_to?(:to_set) ? colors.to_a.flatten : Array(colors)
      colors.map do |color|
        unless color.tap{|c| c.upcase! }[/^#[0-9A-F]{6}/]
          raise "unrecognized color #{color}"
        end
        color
      end
    end
  end
end

