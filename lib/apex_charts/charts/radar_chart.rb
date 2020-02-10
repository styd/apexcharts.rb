# frozen_string_literal: true

module ApexCharts::Charts
  class RadarChart < BaseChart
    def chart_type
      'radar'
    end

    def series_type
      ApexCharts::Series::CartesianSeries
    end
  end
end
