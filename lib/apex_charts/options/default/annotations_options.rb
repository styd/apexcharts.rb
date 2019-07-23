module ApexCharts::Options
  module Default
    class AnnotationsOptions < ::SmartKv
      optional *%i[
        images
        points
        position
        texts
        xaxis
        yaxis
      ]
    end
  end
end
