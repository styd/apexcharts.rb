# frozen_string_literal: true

module ApexCharts::Charts
  class BaseChart
    include ApexCharts::Utils::Hash

    attr_reader :options, :series, :sample

    def initialize(data, options={})
      @series = build_series(data)
      @options = build_options(options)
    end

    def render
      ApexCharts::Renderer.render(options)
    end

    def chart_type; end

  protected

    def build_series(data)
      series_object = series_type.new(data)
      @sample = series_object.sample
      series_object.sanitized
    end

    def build_options(options)
      deep_merge(
        ApexCharts::OptionsBuilder.new(sample, options).build_options,
        camelize_keys(
          {**@series, chart: {type: chart_type}}.compact
        )
      )
    end
  end
end
