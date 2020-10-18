# frozen_string_literal: true

require_relative 'annotations_options/image_annotations'
require_relative 'annotations_options/point_annotations'
require_relative 'annotations_options/text_annotations'
require_relative 'annotations_options/x_axis_annotations'
require_relative 'annotations_options/y_axis_annotations'

module ApexCharts::Options
  module DrySchema
    class AnnotationsOptions < Schema
      define do
        optional(:images).array(ImageAnnotations)
        optional(:points).array(PointAnnotations)
        optional(:position).filled(:string)
        optional(:texts).array(TextAnnotations)
        optional(:xaxis).array(XAxisAnnotations)
        optional(:yaxis).array(YAxisAnnotations)
      end
    end
  end
end
