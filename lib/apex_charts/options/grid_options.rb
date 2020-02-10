# frozen_string_literal: true

module ApexCharts::Options
  class GridOptions < ::SmartKv
    optional *%i[
      borderColor
      column
      padding
      position
      row
      show
      strokeDashArray
      xaxis
      yaxis
    ]
  end
end
