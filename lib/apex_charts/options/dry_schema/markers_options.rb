# frozen_string_literal: true

module ApexCharts::Options
  module DrySchema
    class MarkersOptions < Schema
      define do
        optional(:colors)
        optional(:discrete)
        optional(:fillOpacity)
        optional(:hover)
        optional(:offsetX)
        optional(:offsetY)
        optional(:radius)
        optional(:shape)
        optional(:size)
        optional(:strokeColor)
        optional(:strokeOpacity)
        optional(:strokeWidth)
        optional(:strokeDashArray)
        optional(:showNullDataPoints)
        optional(:onClick)
        optional(:onDblClick)
      end
    end
  end
end
