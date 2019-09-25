# frozen_string_literal: true

module ApexCharts
  class BubbleChart < BaseChart
    def chart_type
      'bubble'
    end

    def series_type
      BubbleSeries
    end
  end
end
