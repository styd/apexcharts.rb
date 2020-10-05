# frozen_string_literal: true

require 'smart_kv'
require_relative 'options/root_options'
require_relative 'options/annotations_options'
require_relative 'options/data_labels_options'
require_relative 'options/fill_options'
require_relative 'options/grid_options'
require_relative 'options/legend_options'
require_relative 'options/markers_options'
require_relative 'options/no_data_options'
require_relative 'options/plot_options'
require_relative 'options/states_options'
require_relative 'options/title_subtitle_options'
require_relative 'options/theme_options'
require_relative 'options/tooltip_options'
require_relative 'options/x_axis_options'
require_relative 'options/y_axis_options'

module ApexCharts
  class OptionsBuilder
    include ApexCharts::Utils::Hash
    include ApexCharts::Utils::DateTime

    attr_reader :built

    def initialize(sample, options)
      @options = camelize_keys(options)
      if options[:plotOptions]&.[](:bar)&.[](:horizontal)
        @ytype = type(sample)
      else
        @xtype = type(sample)
      end
      @built = {}
    end

    def build_options
      Options::RootOptions.check @options

      build_chart
      build_div
      build_general_options
    end

    def build_general_options
      build_annotations
      build_colors
      build_data_labels
      build_defer
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
      @built[:annotations] = (
        Options::AnnotationsOptions.check annotations.compact if annotations.is_a? Hash
      )
    end

    def build_chart
      @built[:chart] =
        if target = @options.delete(:brushTarget)
          {brush: {enabled: true, target: target.to_s}, selection: {enabled: true}}
        else
          {}
        end

      @built[:chart].merge!({
        id: @options[:chartId] || @options[:id],
        group: @options.delete(:group),
        height: @options.delete(:height) { target ? 180 : 400 },
        width: @options.delete(:width),
        stacked: @options.delete(:stacked),
        animations: enabled(@options.delete(:animations)),
        sparkline: enabled(@options.delete(:sparkline)),
        background: @options.delete(:background),
        foreColor: @options.delete(:foreColor)
      }.compact)

      chart = @options.delete :chart

      return unless chart.is_a? Hash

      @built[:chart].merge! Options::ChartOptions.check(chart.compact)
    end

    def build_colors
      colors = @options.delete :colors
      colors &&= Array(colors)
      @built[:colors] = colors
    end

    def build_data_labels
      data_labels = @options.delete :dataLabels
      return if data_labels.nil?

      @built[:dataLabels] = if [true, false].include? data_labels
                              {enabled: data_labels}
                            elsif data_labels.is_a? Hash
                              Options::DataLabelsOptions.check data_labels.compact
                            end
    end

    def build_defer
      defer = @options.delete :defer
      @built[:defer] = defer == true
    end


    def build_fill
      fill = @options.delete :fill
      @built[:fill] = if fill.is_a? String
                        {type: fill}
                      elsif fill.is_a? Hash
                        Options::FillOptions.check fill.compact
                      end
    end

    def build_grid
      grid = @options.delete :grid
      @built[:grid] = if [true, false].include? grid
                        {show: grid}
                      elsif grid.is_a? Hash
                        Options::GridOptions.check grid.compact
                      end
    end

    def build_labels
      labels = @options.delete :labels
      labels &&= Array(labels)
      @built[:labels] = labels
    end

    def build_legend
      legend = @options.delete :legend
      @built[:legend] = if [true, false].include? legend
                          {show: legend}
                        elsif legend.is_a? String
                          {show: true, position: legend}
                        elsif legend.is_a? Hash
                          Options::LegendOptions.check legend.compact
                        end
    end

    def build_markers
      markers = @options.delete :markers
      @built[:markers] = if markers.is_a? String
                           {shape: markers}
                         elsif markers.is_a? Hash
                           Options::MarkersOptions.check markers.compact
                         end
    end

    def build_no_data
      no_data = @options.delete :noData
      @built[:noData] = if no_data.is_a? String
                          {text: no_data}
                        elsif no_data.is_a? Hash
                          Options::NoDataOptions.check no_data.compact
                        end
    end

    def build_plot_options
      plot_options = @options.delete :plotOptions
      return unless plot_options.is_a? Hash

      @built[:plotOptions] =
        Options::PlotOptions.check plot_options.compact
    end

    def build_responsive
      responsive = @options.delete :responsive
      responsive &&= responsive.is_a?(Hash) ? [responsive] : Array(responsive)
      @built[:responsive] = responsive
    end

    def build_states
      @built[:states] = {
        normal: filter_type_hash(@options.delete(:normal)),
        hover: filter_type_hash(@options.delete(:hover)),
        active: filter_type_hash(@options.delete(:active))
      }.compact

      states = @options.delete :states
      @built[:states].merge! Options::StatesOptions.check(states.compact) if states.is_a? Hash

      @built[:states] = nil if @built[:states].empty?
    end

    def build_stroke
      curve = @options.delete :curve
      @built[:stroke] = {curve: curve}.compact

      stroke = @options.delete :stroke
      if [true, false].include? stroke
        @built[:stroke].merge!(show: stroke)
      elsif stroke.is_a? Hash
        @built[:stroke].merge! Options::StrokeOptions.check(stroke.compact)
      end

      @built[:stroke] = nil if @built[:stroke].empty?
    end

    def build_subtitle
      subtitle = @options.delete(:subtitle)
      @built[:subtitle] = if subtitle.is_a? String
                            {text: subtitle}
                          elsif subtitle.is_a? Hash
                            Options::TitleSubtitleOptions.check subtitle.compact
                          end
    end

    def build_theme
      theme = @options.delete(:theme)
      @built[:theme] = if theme.is_a? String
                         case theme
                         when 'random'
                           resolve_theme(Theme.all_palettes.sample)
                         when 'monochrome'
                           {monochrome: {enabled: true}}
                         else
                           resolve_theme(theme)
                         end
                       elsif theme.is_a? Hash
                         Options::ThemeOptions.check theme.compact
                       end
    end

    def build_title
      title = @options.delete(:title)
      @built[:title] = if title.is_a? String
                         {text: title}
                       elsif title.is_a? Hash
                         Options::TitleSubtitleOptions.check title.compact
                       end
    end

    def build_tooltip
      tooltip = @options.delete :tooltip
      @built[:tooltip] = if [true, false].include? tooltip
                           {enabled: tooltip}
                         elsif tooltip.is_a? Hash
                           Options::TooltipOptions.check tooltip.compact
                         end
    end

    def build_xaxis
      xaxis = @options.delete :xaxis
      @built[:xaxis] = {
        type: @options.delete(:xtype) { @xtype },
        title: {
          text: @options.delete(:xtitle)
        }.compact
      }.compact
      @built[:xaxis].delete(:title) if @built[:xaxis][:title].empty?

      if xaxis.is_a? String
        @built[:xaxis][:title] = {text: xaxis}
      elsif xaxis.is_a? Hash
        Options::XAxisOptions.check xaxis
        @built[:xaxis].merge! xaxis
      end

      @built[:xaxis] = nil if @built[:xaxis].empty?
    end

    def build_yaxis
      yaxis = @options.delete :yaxis
      @built[:yaxis] = [{
        type: @options.delete(:ytype) { @ytype },
        title: {
          text: @options.delete(:ytitle)
        }.compact
      }.compact]
      @built[:yaxis][0].delete(:title) if @built[:yaxis][0][:title].empty?

      if yaxis.is_a? String
        @built[:yaxis][0][:title] = {text: yaxis}
      elsif yaxis.is_a? Hash
        Options::YAxisOptions.check yaxis
        @built[:yaxis][0].merge! yaxis
      end

      @built[:yaxis] = nil if @built[:yaxis].all?(&:empty?)
    end

    def enabled(options)
      boolean_to_hash(options) do |opts|
        {enabled: opts}
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

    def resolve_theme(theme)
      if Theme::PALETTES.include? theme
        {palette: theme}
      elsif Theme.palette_names.include? theme
        @built[:colors] = Theme.get_colors(theme)
        nil
      end
    end
  end
end
