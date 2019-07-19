# frozen_string_literal: true

module ApexCharts
  class BubbleChart < BaseChart
    def chart_type
      'bubble'
    end

  private

    def sanitize_data(data)
      ApexCharts::BubbleSeries.new(data).sanitized
    end

    def x_sample
      series[:series][0][:data][0][0]
    end
  end
end
