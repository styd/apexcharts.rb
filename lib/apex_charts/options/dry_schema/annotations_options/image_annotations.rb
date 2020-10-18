# frozen_string_literal: true

require_relative 'annotation_label'

module ApexCharts::Options
  module DrySchema
    ImageAnnotations = ::Dry::Schema.Params do
      optional(:height) { int? | float? }
      optional(:path) { str? }
      optional(:width) { int? | float? }
      optional(:x) { int? | float? }
      optional(:y) { int? | float? }
    end
  end
end
