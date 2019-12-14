# frozen_string_literal: true

module ApexCharts
  module Prefixer
    def self.extended(helper)
      @@helper = helper
    end

    def with_prefix(&block)
      @@prefixed = Module.new(&block)

      unless [nil, ''].include? ApexCharts.helper_prefix
        (@@prefixed.instance_methods - @@helper.instance_methods).each do |method|
          @@prefixed.send(:alias_method, "#{ApexCharts.helper_prefix}#{method}", method)
          @@prefixed.send(:remove_method, method)
        end
      end
      @@helper.send(:include, @@prefixed)
    end
  end
end
