require 'smart_kv'
require_relative 'options/root'
require_relative 'options/annotations'
require_relative 'options/data_labels'
require_relative 'options/fill'
require_relative 'options/grid'
require_relative 'options/legend'
require_relative 'options/markers'
require_relative 'options/no_data'
require_relative 'options/plot_options'
require_relative 'options/states'
require_relative 'options/subtitle'
require_relative 'options/theme'
require_relative 'options/tooltip'
require_relative 'options/x_axis'
require_relative 'options/y_axis'

module Apexcharts
  class OptionsBuilder
    THEME_PALETTES = ["palette1", "palette2", "palette3", "palette4", "palette5", 
                      "palette6", "palette7", "palette8", "palette9", "palette10"]

    attr_reader :built

    def initialize(x_sample, options)
      @options = options
      if options[:plot_options]&.[](:bar)&.[](:horizontal)
        @ytype = Utils::DateTime.type(x_sample)
      else
        @xtype = Utils::DateTime.type(x_sample)
      end
      @built = {}
    end

    def build_options
      RootOptions.check @options

      build_chart
      build_div
      build_annotations
      build_data_labels
      build_fill
      build_grid
      build_labels
      build_legend
      build_markers
      build_no_data
      build_plot_options
      build_responsive
      build_states
      build_stroke
      build_subtitle
      build_theme
      build_title
      build_tooltip
      build_xaxis
      build_yaxis
      built.compact
    end

    def build_div
      @built[:div] = {
        id: @options.delete(:id),
        var: @options.delete(:var),
        class: @options.delete(:class),
        style: @options.delete(:style)
      }.compact
    end

    def build_annotations
      annotations = @options.delete :annotations
      @built[:annotations] = if annotations.is_a? Hash
                               AnnotationsOptions.check annotations.compact
                             end
    end

    def build_chart
      @built[:chart] = if target = @options.delete(:brush_target)
                         {
                           brush: {
                             enabled: true,
                             target: target.to_s
                           },
                           selection: {
                             enabled: true
                           }
                         }
                       else
                         {}
                       end

      @built[:chart].merge!({
        id: @options[:chart_id] || @options[:id],
        group: @options.delete(:group),
        height: @options.delete(:height) { target ? 180 : 400 },
        width: @options.delete(:width),
        stacked: @options.delete(:stacked),
        animations: enabled(@options.delete(:animations)),
        sparkline: enabled(@options.delete(:sparkline)),
        background: @options.delete(:background),
        fore_color: @options.delete(:fore_color) do
                      @options.delete(:foreColor)
                    end
      }.compact)

      chart = @options.delete :chart
      if chart.is_a? Hash
        @built[:chart].merge! ChartOptions.check(chart.compact)
      end
    end

    def build_data_labels
      data_labels = @options.delete :data_labels do
                      @options.delete :dataLabels
                    end
      return if data_labels.nil?
      @built[:data_labels] = if [true, false].include? data_labels
                               {enabled: data_labels}
                             elsif data_labels.is_a? Hash
                               DataLabelsOptions.check data_labels.compact
                             end
    end

    def build_fill
      fill = @options.delete :fill
      @built[:fill] = if fill.is_a? String
                        {type: fill}
                      elsif fill.is_a? Hash
                        FillOptions.check fill.compact
                      end
    end

    def build_grid
      grid = @options.delete :grid
      @built[:grid] = if [true, false].include? grid
                        {show: grid}
                      elsif grid.is_a? Hash
                        GridOptions.check grid.compact
                      end
    end

    def build_labels
      labels = @options.delete :labels
      @built[:labels] = if labels.nil?
                        elsif labels.is_a? Array
                          labels
                        else
                          [labels]
                        end
    end

    def build_legend
      legend = @options.delete :legend
      @built[:legend] = if [true, false].include? legend
                          {show: legend}
                        elsif legend.is_a? String
                          {show: true, position: legend}
                        elsif legend.is_a? Hash
                          LegendOptions.check legend.compact
                        end
    end

    def build_markers
      markers = @options.delete :markers
      @built[:markers] = if markers.is_a? String
                           {shape: markers}
                         elsif markers.is_a? Hash
                           MarkersOptions.check markers.compact
                         end
    end

    def build_no_data
      no_data = @options.delete :no_data
      @built[:no_data] = if no_data.is_a? String
                           {text: no_data}
                         elsif no_data.is_a? Hash
                           NoDataOptions.check no_data.compact
                         end
    end

    def build_plot_options
      plot_options = @options.delete :plot_options do
                       @options.delete :plotOptions
                     end
      @built[:plot_options] = if plot_options.is_a? Hash
                                PlotOptions.check plot_options.compact
                              end
    end

    def build_responsive
      responsive = @options.delete :responsive
      @built[:responsive] = if responsive.nil?
                            elsif responsive.is_a? Array
                              responsive
                            else
                              [responsive]
                            end
    end

    def build_states
      @built[:states] = {
        normal: filter_type_hash(@options.delete :normal),
        hover: filter_type_hash(@options.delete :hover),
        active: filter_type_hash(@options.delete :active)
      }.compact

      states = @options.delete :states
      if states.is_a? Hash
        @built[:states].merge! StatesOptions.check(states.compact)
      end

      @built[:states] = nil if @built[:states].empty?
    end

    def build_stroke
      curve = @options.delete :curve
      @built[:stroke] = {curve: curve}.compact

      stroke = @options.delete :stroke
      if [true, false].include? stroke
        @built[:stroke].merge!({show: stroke})
      elsif stroke.is_a? Hash
        @built[:stroke].merge! StrokeOptions.check(stroke.compact)
      end

      @built[:stroke] = nil if @built[:stroke].empty?
    end

    def build_subtitle
      subtitle = @options.delete(:subtitle)
      @built[:subtitle] = if subtitle.is_a? String
                            {text: subtitle}
                          elsif subtitle.is_a? Hash
                            SubtitleOptions.check subtitle.compact
                          end
    end

    def build_theme
      theme = @options.delete(:theme)
      @built[:theme] = if theme.is_a? String
                         case theme
                         when 'random'
                           {palette: THEME_PALETTES.sample}
                         when 'monochrome'
                           {monochrome: {enabled: true}}
                         else
                           {palette: theme}
                         end
                       elsif theme.is_a? Hash
                         ThemeOptions.check theme.compact
                       end
    end

    def build_title
      title = @options.delete(:title)
      @built[:title] = if title.is_a? String
                         {text: title}
                       elsif title.is_a? Hash
                         TitleOptions.check title.compact
                       end
    end

    def build_tooltip
      tooltip = @options.delete :tooltip
      @built[:tooltip] = if [true, false].include? tooltip
                           {enabled: tooltip}
                         elsif tooltip.is_a? Hash
                           TooltipOptions.check tooltip.compact
                         end
    end

    def build_xaxis
      xaxis = @options.delete :xaxis
      @built[:xaxis] = {
        type: @options.delete(:xtype){ @xtype },
        title: {
          text: @options.delete(:xtitle)
        }.compact
      }.compact
      if @built[:xaxis][:title].empty?
        @built[:xaxis].delete(:title)
      end

      if xaxis.is_a? String
        @built[:xaxis][:title] = {text: xaxis}
      elsif xaxis.is_a? Hash
        XAxisOptions.check xaxis
        @built[:xaxis].merge! xaxis
      end
    end

    def build_yaxis
      yaxis = @options.delete :yaxis
      @built[:yaxis] = [{
        type: @options.delete(:ytype){ @ytype },
        title: {
          text: @options.delete(:ytitle)
        }.compact
      }.compact]
      if @built[:yaxis][0][:title].empty?
        @built[:yaxis][0].delete(:title)
      end

      if yaxis.is_a? String
        @built[:yaxis][0][:title] = {text: yaxis}
      elsif yaxis.is_a? Hash
        YAxisOptions.check yaxis
        @built[:yaxis][0].merge! yaxis
      end
    end

    def type(x)
      if DateTime.iso8601(x).iso8601 == x
        'datetime'
      elsif Date.iso8601(x).iso8601 = x
        'datetime'
      end
    rescue
      'number'
    end

    def enabled(options)
      boolean_to_hash(options) do |options|
        {enabled: options}
      end
    end

    def boolean_to_hash(options)
      return if options.nil?
      if [true, false].include? options
        yield(options)
      elsif options.is_a?(Hash)
        options.compact
      end
    end

    def filter_type_hash(state)
      if state.is_a? String
        {filter: {type: state}}
      elsif state.is_a? Hash
        state.compact
      end
    end
  end
end
