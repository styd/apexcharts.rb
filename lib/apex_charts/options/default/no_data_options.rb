module ApexCharts::Options
  module Default
    class NoDataOptions < ::SmartKv
      optional *%i[
        align
        offsetX
        offsetY
        style
        text
        verticalAlign
      ]
    end
  end
end
