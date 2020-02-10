# frozen_string_literal: true

module ApexCharts::Options
  class AnnotationsOptions < ::SmartKv
    optional *%i[
      points
      position
      xaxis
      yaxis
    ]
  end
end
