# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    DiscretePoint = ::Dry::Schema.Params do
      optional(:dataPointIndex) { int? | float? }
      optional(:fillColor) { str? }
      optional(:seriesIndex) { int? | float? }
      optional(:size) { int? | float? }
      optional(:strokeColor) { str? }
    end
  end
end
