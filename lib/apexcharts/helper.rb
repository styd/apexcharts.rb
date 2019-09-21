# frozen_string_literal: true

require_relative 'config'
require_relative 'series'
require_relative 'options_builder'
require_relative 'utils'
require_relative 'renderer'
require_relative 'charts'
require_relative 'prefixer'
require_relative 'theme'

module ApexCharts
  module Helper
    extend Prefixer

    with_prefix do
      def line_chart(series, options={}, &block)
        outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
        draw_chart(
          LineChart.new(
            outer_self, *prepare_series_and_options(series, options), &block
          )
        )
      end

      def area_chart(series, options={}, &block)
        outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
        draw_chart(
          AreaChart.new(
            outer_self, *prepare_series_and_options(series, options), &block
          )
        )
      end

      def column_chart(series, options={}, &block)
        outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
        draw_chart(
          ColumnChart.new(
            outer_self, *prepare_series_and_options(series, options), &block
          )
        )
      end

      def bar_chart(series, options={}, &block)
        outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
        draw_chart(
          BarChart.new(
            outer_self, *prepare_series_and_options(series, options), &block
          )
        )
      end

      def range_bar_chart(series, options={}, &block)
        outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
        draw_chart(
          RangeBarChart.new(
            outer_self, *prepare_series_and_options(series, options), &block
          )
        )
      end

      def scatter_chart(series, options={}, &block)
        outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
        draw_chart(
          ScatterChart.new(
            outer_self, *prepare_series_and_options(series, options), &block
          )
        )
      end

      def candlestick_chart(series, options={}, &block)
        outer_self = eval('self', block.binding, __FILE__, __LINE__) if block_given?
        draw_chart(
          CandlestickChart.new(
            outer_self, *prepare_series_and_options(series, options), &block
          )
        )
      end
      alias_method :ohlc_chart, :candlestick_chart

      def heatmap_chart(series, options={})
        draw_chart(
          HeatmapChart.new(
            *prepare_series_and_options(series, options)
          )
        )
      end

      def bubble_chart(series, options={})
        draw_chart(
          BubbleChart.new(
            *prepare_series_and_options(series, options)
          )
        )
      end

      def radar_chart(series, options={})
        draw_chart(
          RadarChart.new(
            *prepare_series_and_options(series, options)
          )
        )
      end

      def mixed_charts(options={}, &block)
        outer_self = eval('self', block.binding, __FILE__, __LINE__)
        draw_chart(
          MixedCharts.new(
            outer_self, deep_copy(options), &block
          )
        )
      end
      alias_method :combo_charts, :mixed_charts

      def syncing_charts(options={}, &block)
        outer_self = eval('self', block.binding, __FILE__, __LINE__)
        draw_chart(
          SyncingCharts.new(
            outer_self, deep_copy(options), &block
          )
        )
      end
      alias_method :synchronized_charts, :syncing_charts

      def pie_chart(series, options={})
        draw_chart(
          PieChart.new(
            *prepare_series_and_options(series, options)
          )
        )
      end

      def donut_chart(series, options={})
        draw_chart(
          DonutChart.new(
            *prepare_series_and_options(series, options)
          )
        )
      end

      def radial_bar_chart(series, options={})
        draw_chart(
          RadialBarChart.new(
            *prepare_series_and_options(series, options)
          )
        )
      end
      alias_method :circle_chart, :radial_bar_chart
    end

    def create_palette(palette_name, colors)
      ApexCharts::Theme::Local.create palette_name, colors
    end

    def destroy_palette(palette_name)
      ApexCharts::Theme::Local.destroy palette_name
    end

  private

    def draw_chart(chart)
      chart = chart.render
      chart.respond_to?(:html_safe) ? chart.html_safe : chart
    end

    def prepare_series_and_options(series, options)
      series = deep_copy(series)
      options = deep_copy(options)
      options[:id] ||= apexcharts_id
      [series, options]
    end

    def apexcharts_id
      @_apexcharts_id ||= 0
      @_apexcharts_id += 1
      "#{ApexCharts.helper_prefix}chart-#{@_apexcharts_id}"
    end

    def apexcharts_group
      @_apexcharts_group ||= 0
      @_apexcharts_group += 1
      "#{ApexCharts.helper_prefix}chart-group-#{@_apexcharts_group}"
    end

    include Utils::Copy
  end
end
