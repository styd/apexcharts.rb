module Apexcharts
  module Utils
    module Hash
      def deep_merge(first_hash, second_hash)
        first_hash.merge(second_hash) do |key, this_val, other_val|
          if this_val.is_a?(::Hash) && other_val.is_a?(::Hash)
            deep_merge(this_val.dup, other_val)
          else
            other_val
          end
        end
      end
      module_function :deep_merge

      def camelize(key)
        key.to_s.gsub(/_(.)/) {|m| m[1].upcase }.to_sym
      end
      module_function :camelize

      def camelize_keys(value)
        if value.is_a? ::Hash
          ::Hash[value.map {|k, v| [camelize(k), camelize_keys(v)] }]
        else
          value
        end
      end
      module_function :camelize_keys
    end
  end
end

