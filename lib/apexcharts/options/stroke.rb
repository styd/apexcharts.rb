# frozen_string_literal: true

module ApexCharts
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
