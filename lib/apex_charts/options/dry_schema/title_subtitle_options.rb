# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class TitleSubtitleOptions < Schema
      define do
        optional(:align)
        optional(:floating)
        optional(:margin)
        optional(:offsetX)
        optional(:offsetY)
        optional(:style)
        optional(:text)
      end
    end
  end
end
