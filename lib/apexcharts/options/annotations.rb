# frozen_string_literal: true

module ApexCharts
  class AnnotationsOptions < ::SmartKv
    optional *%i[
      points
      position
      xaxis
      yaxis
    ]
  end
end
