# frozen_string_literal: true

module ApexCharts::Options
  class StrokeOptions < ::SmartKv
    optional *%i[
      colors
      curve
      dashArray
      lineCap
      show
      width
    ]
  end
end
