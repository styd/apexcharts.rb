module Apexcharts
  class BaseChart
    attr_reader :options, :series

    def render
      Apexcharts::Renderer.render_default(options)
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


