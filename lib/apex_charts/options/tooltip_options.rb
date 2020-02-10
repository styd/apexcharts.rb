# frozen_string_literal: true

module ApexCharts::Options
  class TooltipOptions < ::SmartKv
    optional *%i[
      custom
      enabled
      fillSeriesColor
      fixed
      followCursor
      intersect
      inverseOrder
      items
      marker
      onDatasetHover
      shared
      style
      theme
      x
      y
      z
    ]
  end
end
