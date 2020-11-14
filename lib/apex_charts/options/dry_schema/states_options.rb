# frozen_string_literal: true

require_relative 'states_options/filter'

module ApexCharts::Options
  module DrySchema
    class StatesOptions < Schema
      define do
        optional(:active).hash do
          optional(:allowMultipleDataPointsSelection) { bool? }
          optional(:filter).hash(Filter)
        end
        optional(:hover).hash do
          optional(:filter).hash(Filter)
        end
        optional(:normal).hash do
          optional(:filter).hash(Filter)
        end
      end
    end
  end
end
