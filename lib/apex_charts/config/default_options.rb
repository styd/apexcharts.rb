# frozen_string_literal: true

module ApexCharts
  module Config
    module DefaultOptions
      def default_options=(options)
        @default_options =
          ApexCharts::OptionsBuilder.new(nil, options).build_general_options
      end

      def default_options
        @default_options ||= {}
      end
    end
  end
end
