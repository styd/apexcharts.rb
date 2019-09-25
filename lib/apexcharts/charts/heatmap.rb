# frozen_string_literal: true

module ApexCharts
  class HeatmapChart < BaseChart
    def chart_type
      'heatmap'
    end

    def series_type
      CartesianSeries
    end
  end
end
