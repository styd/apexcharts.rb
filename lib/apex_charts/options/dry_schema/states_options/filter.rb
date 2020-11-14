# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    Filter = ::Dry::Schema.Params do
      optional(:type) { str? }
      optional(:value) { int? | float? }
    end
  end
end
