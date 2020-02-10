# frozen_string_literal: true

module ApexCharts
  module Utils
    module Hash
    module_function

      def deep_merge(first_hash, second_hash)
        first_hash.merge(second_hash) do |_key, this_val, other_val|
          if this_val.is_a?(::Hash) && other_val.is_a?(::Hash)
            deep_merge(this_val.dup, other_val)
          else
            other_val
          end
        end
      end

      def camelize(key)
        key.to_s.gsub(/_(.)/) {|m| m[1].upcase }.to_sym
      end

      def camelize_keys(value)
        case value
        when ::Hash
          ::Hash[value.map {|k, v| [camelize(k), camelize_keys(v)] }]
        when Array
          value.map {|e| camelize_keys(e) }
        else
          value
        end
      end
    end
  end
end
