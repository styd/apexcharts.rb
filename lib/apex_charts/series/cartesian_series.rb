# frozen_string_literal: true

require_relative '../utils/copy'

module ApexCharts::Series
  class CartesianSeries
    include ApexCharts::Utils::Copy

    attr_reader :sanitized

    def initialize(data)
      @sanitized = {series: build_series(deep_copy(data))}
    end

    def sample
      return if empty?

      sanitized[:series][0][:data][0][:x]
    end

  private

    def empty?
      sanitized[:series].empty? || sanitized[:series][0][:data].empty?
    end

    def build_series(data)
      return data if data.empty?

      case data
      when Array
        build_series_from_array(data)
      when Hash
        build_series_from_hash(data)
      end
    end

    def build_series_from_array(data)
      case first_data = data[0]
      when Array
        [{data: array_of_array_to_array_of_xy(data)}]

      when Hash
        if first_data[:data]
          data.each {|h| h[:data] = array_of_array_to_array_of_xy(h[:data]) }
          data
        end
      end
    end

    def build_series_from_hash(data)
      if data_value = data[:data]
        if array_of_pairs?(data_value)
          data[:data] = array_of_array_to_array_of_xy(data_value)
          [data]
        end

      elsif data[:x] && data[:y]
        [{data: [data]}]

      else
        [
          {
            data: data.map do |key, value|
              {x: key, y: value}
            end
          }
        ]

      end
    end

    def array_of_pairs?(data)
      !data.empty? && data.all? {|d| d.length == 2 }
    end

    def array_of_array_to_array_of_xy(data)
      data.map {|d| {x: d.first, y: d.last} }
    end
  end
end
