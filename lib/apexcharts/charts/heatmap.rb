# frozen_string_literal: true

module Apexcharts
  class HeatmapChart < BaseChart
    def chart_type
      'heatmap'
    end

  private

    def sanitize_data(data)
      Apexcharts::CartesianSeries.new(data).sanitized
    end
  end
end
