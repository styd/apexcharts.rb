# frozen_string_literal: true

module ApexCharts::Options
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
