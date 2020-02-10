# frozen_string_literal: true

module ApexCharts::Options
  class StatesOptions < ::SmartKv
    optional *%i[
      active
      hover
      normal
    ]
  end
end
