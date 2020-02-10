# frozen_string_literal: true

module ApexCharts::Charts
  class HeatmapChart < BaseChart
    def chart_type
      'heatmap'
    end

    def series_type
      ApexCharts::Series::CartesianSeries
    end
  end
end
