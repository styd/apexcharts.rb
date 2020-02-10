# frozen_string_literal: true

module ApexCharts::Charts
  class PolarChart < BaseChart
    def series_type
      ApexCharts::Series::PolarSeries
    end
  end
end
