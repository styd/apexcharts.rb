module ApexCharts::Options
  module Default
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
end
