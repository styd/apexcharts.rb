module Apexcharts
  class PolarSeries
    attr_reader :sanitized

    def initialize(data)
      @labels = []
      data = deep_copy(data)
      if data.is_a? Array
        if data.first.is_a? Numeric
          @series = data
        elsif data.first.is_a? Hash
          @labels = data.map{|m| m[:name] }.compact
          @series = data.map{|m| m[:data] }
        end
      elsif data.is_a? Hash
        if data[:data].is_a? Array
          @series = data[:data]
        end
      end

      @sanitized = {
        labels: @labels.empty? ? nil : @labels,
        series: @series
      }.compact
    end

    def deep_copy(data)
      Marshal.load(Marshal.dump(data))
    end
  end
end

