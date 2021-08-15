# frozen_string_literal: true

require_relative 'general_schema/function'

module ApexCharts::Options
  module DrySchema
    class LegendOptions < Schema
      define do
        optional(:containerMargin).hash do
          optional(:left) { int? | float? }
          optional(:top) { int? | float? }
        end
        optional(:customLegendItems) { array? & each { str? } }
        optional(:floating) { bool? }
        optional(:fontFamily) { str? }
        optional(:fontSize) { str? }
        optional(:fontWeight) { str? | int? | float? }
        optional(:formatter).hash(Function)
        optional(:height) { int? | float? }
        optional(:horizontalAlign) { included_in?(%w[left center right]) }
        optional(:inverseOrder) { bool? }
        optional(:itemMargin).hash do
          optional(:horizontal) { int? | float? }
          optional(:vertical) { int? | float? }
        end
        optional(:labels).hash do
          optional(:colors) { str? | (array? & each { str? }) }
          optional(:useSeriesColors) { bool? }
        end
        optional(:markers).hash do
          optional(:customHTML).hash(Function)
          optional(:fillColors) { array? & each { str? } }
          optional(:height) { int? | float? }
          optional(:offsetX) { int? | float? }
          optional(:offsetY) { int? | float? }
          optional(:onClick).hash(Function)
          optional(:radius) { int? | float? }
          optional(:strokeColor) { str? }
          optional(:strokeWidth) { int? | float? }
          optional(:width) { int? | float? }
        end
        optional(:offsetX) { int? | float? }
        optional(:offsetY) { int? | float? }
        optional(:onItemClick).hash do
          optional(:toggleDataSeries) { bool? }
        end
        optional(:onItemHover).hash do
          optional(:highlightDataSeries) { bool? }
        end
        optional(:position) { included_in?(%w[top right bottom left]) }
        optional(:show) { bool? }
        optional(:showForNullSeries) { bool? }
        optional(:showForSingleSeries) { bool? }
        optional(:showForZeroSeries) { bool? }
        optional(:textAnchor) { str? }
        optional(:tooltipHoverFormatter).hash(Function)
        optional(:width) { int? | float? }
      end
    end
  end
end
