module ApexCharts::Options
  module Default
    class FillOptions < ::SmartKv
      optional *%i[
        colors
        gradient
        image
        opacity
        pattern
        type
      ]
    end
  end
end
