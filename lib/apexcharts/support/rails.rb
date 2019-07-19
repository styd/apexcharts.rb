# frozen_string_literal: true

module ApexCharts
  class Engine < ::Rails::Engine
    initializer "helper" do |app|
      ActiveSupport.on_load(:action_view) do
        include Helper
      end
    end
  end
end
