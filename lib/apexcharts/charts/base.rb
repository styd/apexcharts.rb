module Apexcharts
  class BaseChart
    attr_reader :options, :series

    def initialize data, options={}
      @series = sanitize_data(data)
      @options = Utils::Hash.deep_merge(
                   build_options(x_sample, options),
                   Utils::Hash.camelize_keys(
                     {**@series, chart: {type: chart_type}}.compact
                   )
                 )
    end

    def render
      Apexcharts::Renderer.render_default(options)
    end

    def chart_type
    end

  protected

    def build_options(x_sample, options)
      Apexcharts::OptionsBuilder.new(x_sample, options).build_options
    end

    def x_sample
      series[:series][0][:data][0][:x]
    end
  end
end


