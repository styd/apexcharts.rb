# frozen_string_literal: true

module Apexcharts
  class RadarChart < BaseChart
    def chart_type
      'radar'
    end

  private

    def sanitize_data(data)
      Apexcharts::CartesianSeries.new(data).sanitized
    end
  end
end
