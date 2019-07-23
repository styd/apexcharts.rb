module ApexCharts::Options
  module Default
    class DataLabelsOptions < ::SmartKv
      optional *%i[
        background
        distributed
        dropShadow
        enabled
        enabledOnSeries
        formatter
        offsetX
        offsetY
        style
        textAnchor
      ]
    end
  end
end
