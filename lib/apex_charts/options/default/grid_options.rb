module ApexCharts::Options
  module Default
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
end
