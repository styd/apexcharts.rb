# frozen_string_literal: true

require_relative 'general_schema/function'
require_relative 'markers_options/discrete_point'

module ApexCharts::Options
  module DrySchema
    class MarkersOptions < Schema
      define do
        optional(:colors) { array? & each { str? } }
        optional(:discrete).array(DiscretePoint)
        optional(:fillOpacity) { int? | float? | (array? & each { int? | float? }) }
        optional(:height) { int? | float? }
        optional(:hover).hash do
          optional(:size) { int? | float? }
          optional(:sizeOffset) { int? | float? }
        end
        optional(:offsetX) { int? | float? }
        optional(:offsetY) { int? | float? }
        optional(:onClick).hash(Function)
        optional(:onDblClick).hash(Function)
        optional(:radius) { int? | float? }
        optional(:shape) { included_in?(%w[circle square]) | (array? & each { str? }) }
        optional(:showNullDataPoints) { bool? }
        optional(:size) { int? | float? | (array? & each { int? | float? }) }
        optional(:strokeColor) { str? | (array? & each { str? }) }
        optional(:strokeDashArray) { int? | float? | (array? & each { int? | float? }) }
        optional(:strokeOpacity) { int? | float? | (array? & each { int? | float? }) }
        optional(:strokeWidth) { int? | float? | (array? & each { int? | float? }) }
        optional(:width) { int? | float? }
      end
    end
  end
end
