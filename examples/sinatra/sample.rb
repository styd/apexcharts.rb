# frozen_string_literal: true

require 'sinatra/base'
require 'apexcharts'

class ApexChartsOnSinatra < Sinatra::Base
  helpers Sinatra::ApexCharts

  template :layout do
    <<~LAYOUT
      <html>
        <body>
          <%= yield %>
        </body>
      </html>
    LAYOUT
  end

  template :index do
    <<~INDEX
      <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
      <%= pie_chart([
        {name: "Series A", data: 25},
        {name: "Series B", data: 100},
        {name: "Series C", data: 200},
        {name: "Series D", data: 125}
      ], legend: "left") %>
    INDEX
  end

  get '/' do
    erb :index
  end
end
