# frozen_string_literal: true

module ApexCharts::Charts
  class BubbleChart < BaseChart
    def chart_type
      'bubble'
    end

    def series_type
      ApexCharts::Series::BubbleSeries
    end
  end
end
