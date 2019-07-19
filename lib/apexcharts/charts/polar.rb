module ApexCharts
  class PolarChart < BaseChart

  protected

    def sanitize_data(data)
      ApexCharts::PolarSeries.new(data).sanitized
    end

    def x_sample
    end
  end
end

