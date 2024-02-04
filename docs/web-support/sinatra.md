### Sinatra

Require it after you `require 'sinatra/base'` and add helper `Sinatra::ApexCharts` in the
class that inherits from `Sinatra::Base`.

```ruby
require 'sinatra/base'
require 'apexcharts'

class SimpleApp < Sinatra::Base
  helpers Sinatra::ApexCharts
end
```

To add the asset (ApexCharts.JS), include a script tag in your template
as follows:

```ruby
template :index do
  <<~INDEX
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <% series = {...} %>
    <%= pie_chart(series, legend: "left") %>
  INDEX
end
```

For more details, [see example](examples/sinatra/sample.rb).
