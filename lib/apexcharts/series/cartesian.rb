module Apexcharts
  class CartesianSeries
    attr_reader :sanitized

    def initialize(data)
      data = deep_copy(data)
      if data.is_a?(Array)
        if (data.to_h rescue nil)
          @sanitized = [data.to_h]
        else
          @sanitized = data.map(&:to_h)
        end
      else
        @sanitized = [data]
      end

      unless sanitized[0][:data]
        @sanitized = sanitized.map{|a| {data: a} }
      end

      @sanitized = {series: sanitized.each {|a| a[:data] = a[:data].map{|k,v| {x: k, y: v} } } }
    end

    def deep_copy(data)
      Marshal.load(Marshal.dump(data))
    end
  end
end

