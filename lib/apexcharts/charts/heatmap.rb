# frozen_string_literal: true

module ApexCharts
  class HeatmapChart < BaseChart
    def chart_type
      'heatmap'
    end

  private

    def sanitize_data(data)
      ApexCharts::CartesianSeries.new(data).sanitized
    end
  end
end
