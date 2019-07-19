module Apexcharts
  class PolarChart < BaseChart

  protected

    def sanitize_data(data)
      Apexcharts::PolarSeries.new(data).sanitized
    end

    def x_sample
    end
  end
end

