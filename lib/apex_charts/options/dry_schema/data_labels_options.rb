# frozen_string_literal: true

require_relative 'general_schema/function'
require_relative 'general_schema/drop_shadow'

module ApexCharts::Options
  module DrySchema
    class DataLabelsOptions < Schema
      define do
        optional(:background).hash do
          optional(:borderColor) { str? }
          optional(:borderRadius) { int? | float? }
          optional(:borderWidth) { int? | float? }
          optional(:dropShadow).hash(DropShadow)
          optional(:enabled) { bool? }
          optional(:foreColor) { str? }
          optional(:opacity) { int? | float? }
          optional(:padding) { int? | float? }
        end
        optional(:distributed) { bool? }
        optional(:dropShadow).hash(DropShadow)
        optional(:enabled) { bool? }
        optional(:enabledOnSeries) { !nil? > (int? | float?) }
        optional(:formatter).hash(Function)
        optional(:offsetX) { int? | float? }
        optional(:offsetY) { int? | float? }
        optional(:style).hash do
          optional(:colors) { array? & each { str? } }
          optional(:fontFamily) { str? }
          optional(:fontSize) { str? }
          optional(:fontWeight) { str? | int? | float? }
        end
        optional(:textAnchor) { included_in? %w[start middle end] }
      end
    end
  end
end
