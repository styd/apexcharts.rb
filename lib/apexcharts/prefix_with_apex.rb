# frozen_string_literal: true

warn <<~DEPRECATED
  Deprecation warning from ApexCharts.RB:

  Using

    gem 'apexcharts', require: 'apexcharts/prefix_with_apex'

  is DEPRECATED.

  Please use

    gem 'apexcharts', require: 'apex_charts/prefix_with_apex'

  instead.

DEPRECATED

require_relative '../apex_charts/prefix_with_apex'
