# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    Function = ::Dry::Schema.Params do
      optional(:function).hash do
        optional(:args) { str? }
        optional(:body) { str? }
      end
    end
  end
end
