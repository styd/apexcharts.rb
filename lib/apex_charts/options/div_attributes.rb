# frozen_string_literal: true

module ApexCharts::Options
  class DivAttributes < ::SmartKv
    optional *%i[
      class
      id
      style
    ]
  end
end
