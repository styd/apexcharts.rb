# frozen_string_literal: true

module ApexCharts
  class RadarChart < BaseChart
    def chart_type
      'radar'
    end

    def series_type
      CartesianSeries
    end
  end
end
