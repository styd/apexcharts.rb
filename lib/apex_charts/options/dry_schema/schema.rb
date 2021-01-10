require 'dry/schema'

Dry::Schema.config.validate_keys = true

module ApexCharts::Options
  module DrySchema
    class Schema < ::Dry::Schema::Params
      class << self
        def check(hash)
          return hash if production?

          schema = new[hash]
          if schema.failure?
            raise schema.errors.to_h.inspect
          else
            hash
          end
        end

        def keys
          definition.send(:key_map).map{|key| key.name.to_sym }
        end

      private

        def production?
          (ENV['APP_ENV'] || ENV['RAILS_ENV'] || ENV['RACK_ENV']) == "production"
        end
      end
    end
  end
end
