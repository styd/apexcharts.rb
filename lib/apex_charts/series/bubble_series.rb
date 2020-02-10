# frozen_string_literal: true

require_relative '../utils/copy'

module ApexCharts::Series
  class BubbleSeries
    include ApexCharts::Utils::Copy

    attr_reader :sanitized

    def initialize(data)
      data = deep_copy(data)
      sanitized =
        case data
        when Array
          if array_of_threes?(data)
            [{data: data}]
          else
            data
          end

        when Hash
          if data_value = data[:data]
            [data] if array_of_threes?(data_value)
          end

        end

      @sanitized = {series: sanitized}
    end

    def sample
      return if empty?

      sanitized[:series][0][:data][0]
    end

  private

    def empty?
      sanitized[:series].empty? || sanitized[:series][0][:data].empty?
    end

    def array_of_threes?(data)
      return false if data.empty?

      data.all? {|d| d.length == 3 }
    end
  end
end
