require 'dry/schema'

Dry::Schema.config.validate_keys = true

module ApexCharts::Options
  module DrySchema
    class Schema < ::Dry::Schema::Params
      class << self
        def check(hash)
          schema = new[hash]
          if schema.failure?
            raise schema.errors.to_h.inspect
          else
            hash
          end
        end

        def keys
          definition.send(:key_map).map{|key| key.dump.to_sym }
        end
      end
    end
  end
end
