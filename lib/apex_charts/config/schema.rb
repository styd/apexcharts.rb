# frozen_string_literal: true

module ApexCharts
  module Config
    module Schema
      def schema
        @schema ||= 'Default'
      end

      def schema=(name)
        @schema = case name
                  when :dry_schema, 'dry_schema', 'dry-schema'
                    'DrySchema'
                  else
                    'Default'
                  end
      end
    end
  end
end
