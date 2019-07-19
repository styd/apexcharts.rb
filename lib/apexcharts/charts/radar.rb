# frozen_string_literal: true

module ApexCharts
  class RadarChart < BaseChart
    def chart_type
      'radar'
    end

  private

    def sanitize_data(data)
      ApexCharts::CartesianSeries.new(data).sanitized
    end
  end
end
