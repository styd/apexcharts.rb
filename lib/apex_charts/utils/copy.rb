# frozen_string_literal: true

module ApexCharts
  module Utils
    module Copy
      def deep_copy(data)
        Marshal.load(Marshal.dump(data))
      end
    end
  end
end
