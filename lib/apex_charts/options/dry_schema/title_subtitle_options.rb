# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class TitleSubtitleOptions < Schema
      define do
        optional(:align) { included_in? %w[left center right] }
        optional(:floating) { bool? }
        optional(:margin) { int? | float? }
        optional(:offsetX) { int? | float? }
        optional(:offsetY) { int? | float? }
        optional(:style).hash do
          optional(:color) { str? }
          optional(:fontFamily) { str? }
          optional(:fontSize) { str? }
          optional(:fontWeight) { str? | int? | float? }
        end
        optional(:text) { str? }
      end
    end
  end
end
