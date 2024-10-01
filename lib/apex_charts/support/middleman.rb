# frozen_string_literal: true

class ApexCharts::Middleman < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  helpers ::ApexCharts::Helper
end

::Middleman::Extensions.register(:apexcharts, ApexCharts::Middleman)
