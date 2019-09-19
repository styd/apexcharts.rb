module ApexCharts
  module DefaultOptions
    def default_options=(options)
      @default_options =
        ApexCharts::OptionsBuilder.new(nil, options)
                                  .build_general_options
    end

    def default_options
      @default_options ||= {}
    end
  end
end
