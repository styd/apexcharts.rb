# frozen_string_literal: true

require_relative 'general_schema/function'
require_relative 'general_schema/drop_shadow'

module ApexCharts::Options
  module DrySchema
    class PlotOptions < Schema
      define do
        optional(:area).hash do
          optional(:fillTo) { included_in? %w[origin end] }
        end
        optional(:bar).hash do
          optional(:barHeight) { str? }
          optional(:borderRadius) { int? | float? }
          optional(:colors).hash do
            optional(:backgroundBarColors) { array? & each { str? } }
            optional(:backgroundBarOpacity) { int? | float? }
            optional(:backgroundBarRadius) { int? | float? }
            optional(:ranges).array(:hash) do
              optional(:color) { str? }
              optional(:from) { int? | float? }
              optional(:to) { int? | float? }
            end
          end
          optional(:columnWidth) { str? }
          optional(:dataLabels).hash do
            optional(:hideOverflowingLabels) { bool? }
            optional(:maxItems) { int? | float? }
            optional(:orientation) { included_in? %w[horizontal vertical] }
            optional(:position) { str? }
          end
          optional(:distributed) { bool? }
          optional(:endingShape) { included_in? %w[flat rounded] }
          optional(:horizontal) { bool? }
          optional(:rangeBarOverlap) { bool? }
          optional(:rangeBarGroupRows) { bool? }
          optional(:startingShape) { included_in? %w[flat rounded] }
        end
        optional(:boxPlot).hash do
          optional(:colors).hash do
            optional(:upper) { str? }
            optional(:lower) { str? }
          end
        end
        optional(:bubble).hash do
          optional(:maxBubbleRadius) { int? | float? }
          optional(:minBubbleRadius) { int? | float? }
        end
        optional(:candlestick).hash do
          optional(:colors).hash do
            optional(:upward) { str? }
            optional(:downward) { str? }
          end
          optional(:wick).hash do
            optional(:useFillColor) { bool? }
          end
        end
        optional(:heatmap).hash do
          optional(:colorScale).hash do
            optional(:inverse) { bool? }
            optional(:max) { int? | float? }
            optional(:min) { int? | float? }
            optional(:ranges).array(:hash) do
              optional(:color) { str? }
              optional(:foreColor) { str? }
              optional(:from) { int? | float? }
              optional(:name) { str? }
              optional(:to) { int? | float? }
            end
          end
          optional(:distributed) { bool? }
          optional(:enableShades) { bool? }
          optional(:radius) { int? | float? }
          optional(:reverseNegativeShade) { bool? }
          optional(:shadeIntensity) { int? | float? }
          optional(:useFillColorAsStroke) { bool? }
        end
        optional(:pie).hash do
          optional(:customScale) { int? | float? }
          optional(:dataLabels).hash do
            optional(:minAngleToShowLabel) { int? | float? }
            optional(:offset) { int? | float? }
          end
          optional(:donut).hash do
            optional(:background) { str? }
            optional(:labels).hash do
              optional(:name).hash do
                optional(:color) { str? }
                optional(:fontFamily) { str? }
                optional(:fontSize) { str? }
                optional(:fontWeight) { str? | int? | float? }
                optional(:formatter).hash(Function)
                optional(:offsetY) { int? | float? }
                optional(:show) { bool? }
              end
              optional(:show) { bool? }
              optional(:total).hash do
                optional(:color) { str? }
                optional(:fontFamily) { str? }
                optional(:fontSize) { str? }
                optional(:fontWeight) { str? | int? | float? }
                optional(:formatter).hash(Function)
                optional(:label) { str? }
                optional(:offsetY) { int? | float? }
                optional(:show) { bool? }
                optional(:showAlways) { bool? }
              end
              optional(:value).hash do
                optional(:color) { str? }
                optional(:fontFamily) { str? }
                optional(:fontSize) { str? }
                optional(:fontWeight) { str? | int? | float? }
                optional(:formatter).hash(Function)
                optional(:offsetY) { int? | float? }
                optional(:show) { bool? }
              end
            end
            optional(:size) { str? }
          end
          optional(:expandOnClick) { int? | float? }
          optional(:offsetX) { int? | float? }
          optional(:offsetY) { int? | float? }
          optional(:startAngle) { int? | float? }
          optional(:endAngle) { int? | float? }
        end
        optional(:polarArea).hash do
          optional(:rings).hash do
            optional(:strokeColor) { str? }
            optional(:strokeWidth) { int? | float? }
          end
          optional(:spokes).hash do
            optional(:connectorColors) { str? | (array? & each { str? }) }
            optional(:strokeWidth) { int? | float? }
          end
        end
        optional(:radar).hash do
          optional(:offsetX) { int? | float? }
          optional(:offsetY) { int? | float? }
          optional(:polygons).hash do
            optional(:connectorColors) { str? | (array? & each { str? }) }
            optional(:fill).hash do
              optional(:colors) { str? | (array? & each { str? }) }
            end
            optional(:strokeColors) { str? | (array? & each { str? }) }
            optional(:strokeWidth) { str? | (array? & each { str? }) }
          end
          optional(:size) { int? | float? }
        end
        optional(:radialBar).hash do
          optional(:dataLabels).hash do
            optional(:name).hash do
              optional(:color) { str? }
              optional(:fontFamily) { str? }
              optional(:fontSize) { str? }
              optional(:fontWeight) { str? | int? | float? }
              optional(:offsetY) { int? | float? }
              optional(:show) { bool? }
            end
            optional(:show) { bool? }
            optional(:total).hash do
              optional(:color) { str? }
              optional(:fontFamily) { str? }
              optional(:fontSize) { str? }
              optional(:fontWeight) { str? | int? | float? }
              optional(:formatter).hash(Function)
              optional(:label) { str? }
              optional(:show) { bool? }
            end
            optional(:value).hash do
              optional(:color) { str? }
              optional(:fontFamily) { str? }
              optional(:fontSize) { str? }
              optional(:fontWeight) { str? | int? | float? }
              optional(:formatter).hash(Function)
              optional(:offsetY) { int? | float? }
              optional(:show) { bool? }
            end
          end
          optional(:endAngle) { int? | float? }
          optional(:hollow).hash do
            optional(:background) { str? }
            optional(:dropShadow).hash(DropShadow)
            optional(:image) { str? }
            optional(:imageClipped) { bool? }
            optional(:imageHeight) { int? | float? }
            optional(:imageOffsetX) { int? | float? }
            optional(:imageOffsetY) { int? | float? }
            optional(:imageWidth) { int? | float? }
            optional(:margin) { int? | float? }
            optional(:position) { included_in?(%w[front back]) }
            optional(:size) { str? }
          end
          optional(:inverseOrder) { bool? }
          optional(:offsetX) { int? | float? }
          optional(:offsetY) { int? | float? }
          optional(:startAngle) { int? | float? }
          optional(:track).hash do
            optional(:background) { str? }
            optional(:dropShadow).hash(DropShadow)
            optional(:endAngle) { int? | float? }
            optional(:margin) { int? | float? }
            optional(:opacity) { int? | float? }
            optional(:show) { bool? }
            optional(:startAngle) { int? | float? }
            optional(:strokeWidth) { str? }
          end
        end
        optional(:treemap).hash do
          optional(:colorScale).hash do
            optional(:inverse) { bool? }
            optional(:max) { int? | float? }
            optional(:min) { int? | float? }
            optional(:ranges).array(:hash) do
              optional(:color) { str? }
              optional(:foreColor) { str? }
              optional(:from) { int? | float? }
              optional(:name) { str? }
              optional(:to) { int? | float? }
            end
          end
          optional(:distributed) { bool? }
          optional(:enableShades) { bool? }
          optional(:reverseNegativeShade) { bool? }
          optional(:shadeIntensity) { int? | float? }
          optional(:useFillColorAsStroke) { bool? }
        end
      end
    end
  end
end
