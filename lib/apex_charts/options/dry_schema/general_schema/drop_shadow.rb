# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    DropShadow = ::Dry::Schema.Params do
      optional(:blur) { int? | float? }
      optional(:color) { str? }
      optional(:enabled) { bool? }
      optional(:left) { int? | float? }
      optional(:opacity) { int? | float? }
      optional(:top) { int? | float? }
    end
  end
end
