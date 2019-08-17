<p align="center">
  <img src="images/placeholder.png" height="150">
</p>

<p align="center">
  <a href="https://github.com/styd/apexcharts.rb/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-brightgreen.svg" alt="License"></a>
  <a href="https://travis-ci.org/styd/apexcharts.rb"><img src="https://travis-ci.org/styd/apexcharts.rb.svg?branch=master" alt="Build Status" /></a>
  <a href="https://rubygems.org/gems/apexcharts"><img alt="Downloads" src="https://img.shields.io/gem/dt/apexcharts"></a>
  <a href="https://rubygems.org/gems/apexcharts"><img src="https://badge.fury.io/rb/apexcharts.svg" alt="Gem Version" /></a>
  <a href="https://codeclimate.com/github/styd/apexcharts.rb/maintainability"><img src="https://api.codeclimate.com/v1/badges/07a4f59e67abfeae21cb/maintainability" /></a>
  <a href="https://codeclimate.com/github/styd/apexcharts.rb/test_coverage"><img src="https://api.codeclimate.com/v1/badges/07a4f59e67abfeae21cb/test_coverage" /></a>
</p>


## What is this?

ApexCharts.rb is a ruby gem that wraps a JavaScript charting library called with the same name,
[ApexCharts.js](https://github.com/apexcharts/apexcharts.js), that's going to give you
beautiful, interactive, and responsive charts for your ruby app.


## Table of Contents

- [Usage](#usage)
  - [Cartesian Charts](#cartesian-charts)
    - [Line Chart](#line-chart)
    - [Stepline Chart](#stepline-chart)
    - [Area Chart](#area-chart)
    - [Column Chart](#column-chart)
    - [Bar Chart](#bar-chart)
    - [Range Bar Chart](#range-bar-chart)
    - [Scatter Chart](#scatter-chart)
    - [Candlestick Chart](#candlestick-chart)
    - [Mixed Charts](#mixed-charts)
    - [Syncing Charts](#syncing-charts)
    - [Brush Chart](#brush-chart)
    - [Annotations](#annotations)
  - [Heatmap Chart](#heatmap-chart)
  - [Radar Chart](#radar-chart)
  - [Bubble Chart](#bubble-chart)
  - [Polar Charts](#polar-charts)
    - [Pie Chart](#pie-chart)
    - [Donut Chart](#donut-chart)
    - [Radial Bar Chart](#radial-bar-chart)
- [Data Formats](#data-formats)
  - [Cartesian Charts](#cartesian-charts-1)
    - [Candlestick Chart](#candlestick-chart-1)
  - [Heatmap Chart](#heatmap-chart-1)
  - [Radar Chart](#radar-chart-1)
  - [Bubble Chart](#bubble-chart-1)
  - [Polar Charts](#polar-charts-1)
- [Options (Reference)](#options-reference)
- [Installation](#installation)
- [Web Support](#web-support)
  - [Rails](#rails)
  - [Plain HTML+ERB (Without Framework)](#plain-htmlerb-without-framework)
- [TODOs](#todos)
- [Contributing](#contributing)
- [License](#license)
- [Like the charts?](#like-the-charts)


## Usage

### Cartesian Charts

Example series used for cartesian charts:

```erb
<% series = [
  {name: "Inactive", data: @inactive_properties},
  {name: "Active", data: @active_properties}
] %>
```
To build the data, you can use gem [groupdate](https://github.com/ankane/groupdate).  
In my case, it was:

```ruby
@inactive_properties = Property.inactive.group_by_week(:created_at).count
@active_properties = Property.active.group_by_week(:created_at).count
```

and I'll get the data in this format:
```ruby
{
  Sun, 29 Jul 2018=>1,
  Sun, 05 Aug 2018=>6,
  ..
}
```
PS: `Property` can be any model you have and `inactive` and `active`
are just some normal ActiveRecord scopes. Keep scrolling down to see
accepted data formats.  

Example options used for cartesian charts:

```erb
<% options = {
  title: 'Properties Growth',
  subtitle: 'Grouped Per Week',
  xtitle: 'Week',
  ytitle: 'Properties',
  stacked: true
} %>
```


#### Line Chart

```erb
<%= line_chart(series, options) %>
```
![Example Line Chart](images/line_chart.gif)


#### Stepline Chart

```erb
<%= line_chart(series, {**options, theme: 'palette7', curve: 'stepline'}) %>
```
![Example Stepline Chart](images/stepline_chart.gif)


#### Area Chart

```erb
<%= area_chart(series, {**options, theme: 'palette5'}) %>
```
![Example Area Chart](images/area_chart.gif)


#### Column Chart

```erb
<%= column_chart(series, {**options, theme: 'palette4'}) %>
```
![Example Column Chart](images/column_chart.gif)


#### Bar Chart

```erb
<%= bar_chart(series, {**options, xtitle: 'Properties', ytitle: 'Week', height: 800, theme: 'palette7'}) %>
```
![Example Bar Chart](images/bar_chart.gif)


#### Range Bar Chart

```erb
<% range_bar_series = [{
      name: "Series A",
      data: {
        'A' => [1, 5],
        'B' => [4, 6],
        'C' => [5, 8],
        'D' => [3, 11]
      }
    }, {
      name: "Series B",
      data: {
        'A' => [2, 6],
        'B' => [1, 3],
        'C' => [7, 8],
        'D' => [5, 9]
      }
  }]
%>

<%= range_bar_chart(range_bar_series, theme: 'palette3') %>
```
![Example Range Bar Chart](images/range_bar_chart.gif)


#### Scatter Chart

```erb
<%= scatter_chart(series, {**options, theme: 'palette3'}) %>
```
![Example Scatter Chart](images/scatter_chart.gif)


#### Candlestick Chart
Candlestick chart is typically used to illustrate movements in the price of a
financial instrument over time. This chart is also popular by the name "ohlc chart".
That's why you can call it with `ohlc_chart` too.  
So, here's how you make it.

Given:
```erb
<%
  require 'date'

  def ohlc(ary)
    [rand(ary.min..ary.max), ary.max, ary.min, rand(ary.min..ary.max)]
  end

  candlestick_data = 50.times.map do |i|
    [Date.today - 50 + i, ohlc(Array.new(2){ rand(6570..6650) })]
  end.to_h

  candlestick_options = {
    plot_options: {
      candlestick: {
        colors: {
          upward: '#3C90EB',
          downward: '#DF7D46'
        }
      }
    }
  }
%>
```
You can make candlestick chart with this:
```erb
<%= candlestick_chart(candlestick_data, candlestick_options) %>
```
![Example Candlestick Chart](images/candlestick_chart.gif)

Real life candlestick chart probably don't look like that.
That's because I just use random sets of numbers as the data.


#### Mixed Charts

You can mix charts by using `mixed_charts` or `combo_charts` methods.
For example, given that:
```ruby
@total_properties = Property.group_by_week(:created_at).count
```
and
```erb
<% total_series = {
  name: "Total", data: @total_properties
} %>
```
you can do this:
```erb
<%= combo_charts({**options, theme: 'palette4', stacked: false, data_labels: false}) do %>
  <% line_chart(total_series) %>
  <% area_chart(series.last) %>
  <% column_chart(series.first) %>
<% end %>
```
![Example Mixed Charts](images/mixed_charts.gif)


#### Syncing Charts

You can synchronize charts by using `syncing_charts` or `synchronized_charts` methods. For example:
```erb
<%= syncing_charts(chart: {toolbar: false}, height: 250, style: 'display: inline-block; width: 32%;') do %>
  <% mixed_charts(theme: 'palette4', data_labels: false) do %>
    <% line_chart({name: "Total", data: @total_properties}) %>
    <% area_chart({name: "Active", data: @active_properties}) %>
  <% end %>
  <% area_chart({name: "Active", data: @active_properties}, theme: 'palette6') %>
  <% line_chart({name: "Inactive", data: @active_properties}, theme: 'palette8') %>
<% end %>
```
![Example Syncing Charts](images/syncing_charts.gif)


#### Brush Chart

```erb
<%= area_chart(total_series, {
  **options, chart_id: 'the-chart', xtitle: nil, theme: 'palette2'
}) %>
<%= mixed_charts(brush_target: 'the-chart', theme: 'palette7') do %>
  <% column_chart(series.first) %>
  <% line_chart(series.last) %>
<% end %>
```
![Example Brush Chart](images/brush_chart.gif)


#### Annotations

All cartesian charts can have annotations, for example:

```erb
<%= area_chart(series, {**options, theme: 'palette9'}) do %>
  <% x_annotation(value: ('2019-01-06'..'2019-02-24'), text: "Busy Time", color: 'green') %>
  <% y_annotation(value: 29, text: "Max Properties", color: 'blue') %>
  <% point_annotation(value: ['2018-10-07', 24], text: "First Peak", color: 'magenta') %>
<% end %>
```
![Example Area Chart with Annotations](images/chart_with_annotations.gif)


### Heatmap Chart

```erb
<% heatmap_series = 17.downto(10).map do |n|
  {
    name: "#{n}:00",
    data: 15.times.map do |i|
      ["W#{i+1}", rand(90)]
    end.to_h
  }
end %>
<%= heatmap_chart(heatmap_series) %>
```
![Example Heatmap Chart](images/heatmap_chart.png)


### Radar Chart

```erb
<% radar_series = [
  {
    name: "What it should be",
    data: { "Code review"=>10, "Issues"=>5, "Pull request"=>25, "Commits"=>60 }
  },
  {
    name: "What it really is",
    data: { "Code review"=>1, "Issues"=>3, "Pull request"=>7, "Commits"=>89 }
  }
] %>
<%= radar_chart(
  radar_series,
  {title: "GitHub Radar", markers: {size: 4}, theme: 'palette4'}
) %>
```
![Example Radar Chart](images/radar_chart.gif)


### Bubble Chart

```erb
<% bubble_series = (1..4).map do |n|
  {
    name: "Bubble#{n}",
    data: 20.times.map{[rand(750),rand(10..60),rand(70)]}
  }
end %>
<%= bubble_chart(bubble_series, data_labels: false, theme: 'palette6') %>
```
![Example Bubble Chart](images/bubble_chart.png)


### Polar Charts

#### Pie Chart

```erb
<%= pie_chart([
  {name: "Series A", data: 25},
  {name: "Series B", data: 100},
  {name: "Series C", data: 200},
  {name: "Series D", data: 125}
], legend: "left") %>
```
![Example Pie Chart](images/pie_chart.gif)


#### Donut Chart

```erb
<%= donut_chart([25, 100, 200, 125], theme: 'palette4') %>
```
![Example Pie Chart](images/donut_chart.gif)


#### Radial Bar Chart

Also called `circle_chart`.
```erb
<%= radial_bar_chart([
  {name: "Circle A", data: 25},
  {name: "Circle B", data: 40},
  {name: "Circle C", data: 80},
  {name: "Circle D", data: 45}
], legend: true) %>
```
![Example Circle Chart](images/radial_bar_chart.gif)


## Data Formats

### Cartesian Charts
The data format for line, stepline, area, column, bar, and scatter
charts should be in following format **per-series**:

```ruby
{
  <x value> => <y value>,
  <x value> => <y value>,
  ...
}
```

or this:

```ruby
[
  [<x value>, <y value>],
  [<x value>, <y value>],
  ...
]
```

#### Candlestick Chart
Candlestick chart is just like other cartesian charts, only the y value is
an array of 4 members which called the OHLC (Open-High-Low-Close):

```ruby
{
  <x value> => [<Open>, <High>, <Low>, <Close>],
  <x value> => [<Open>, <High>, <Low>, <Close>],
  ...
}
```

or this:

```ruby
[
  [<x value>, [<Open>, <High>, <Low>, <Close>]],
  [<x value>, [<Open>, <High>, <Low>, <Close>]],
  ...
]
```

### Heatmap Chart
The data format for heatmap chart **per-series** is similar to cartesian
charts. But instead of y values they are heat values. The series names will
be the y values.

```ruby
{
  <x value> => <heat value>,
  <x value> => <heat value>,
  ...
}
```

or this:

```ruby
[
  [<x value>, <heat value>],
  [<x value>, <heat value>],
  ...
]
```

### Radar Chart
The data format for radar chart **per-series** is also similar but instead
of x values they are variables and instead of y values they are the only
values for the variables with type of Numeric.

```ruby
{
  <variable> => <value>,
  <variable> => <value>,
  ...
}
```

or this:

```ruby
[
  [<variable>, <value>],
  [<variable>, <value>],
  ...
]
```


### Bubble Chart
Bubble chart is similar to scatter chart, only they have one more value
for bubble size:

```ruby
[
  [<x value>, <bubble size>, <y value>],
  [<x value>, <bubble size>, <y value>],
  ...
]
```

### Polar Charts
The data format for donut, pie, and radial bar are the simplest. They are
just any single value of type Numeric.


## Options (Reference)
ApexCharts.rb supports [all options from apexcharts.js](https://apexcharts.com/docs/options/), but instead of camelCase, you can write them in snake_case.

ApexCharts.rb also provides shortcuts to some ApexCharts.js options, such as `title`. In ApexCharts.js you would have to write `title: { text: "Some title" }`. In ApexCharts.rb you can write `title: "Some title"` if you just want to add the text.
`xtitle` and `ytitle` are even greater shortcuts. Instead of `xaxis: { title: { text: "x title" } }` you can write `xtitle: "x title"`."

```ruby
options = {
  animations: false, # Shortcut for chart: { animations: { enabled: false } }
  chart: {
    fontFamily: "Helvetica, Arial, sans-serif",
    toolbar: {
      show: false
    }
  },
  curve: "straight", # Shortcut for stroke: { curve: "straight" }
  markers: {
    size: 5,
  },
  tooltip: false, # Shortcut for tooltip: { enabled: false }
  xtitle: "Boars per capita"
}
```

These options can be passed to any chart helper like `<%= line_chart(series, options) %>`.

### Global options

To change options globally, you can manipulate the `Apex` JavaScript object directly:

```javascript
require("apexcharts")

const apexGlobalOptions = {
  chart: {
    …
  },
  …
}

Object.assign(Apex, apexGlobalOptions)
```

All charts will then be created with these global options, which can be overwritten individually by any ApexCharts.rb helper method.


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'groupdate' # optional
gem 'apexcharts'
```

And then execute:
```bash
$ bundle
```


## Web Support

### Rails
After installing the gem, require it in your `app/assets/javascripts/application.js`.
```js
//= require apexcharts
```

Or, if you use `webpacker`, you can run:
```bash
$ yarn add apexcharts
```
and then require it in your `app/javascript/packs/application.js`.
```js
require("apexcharts")
```

### Plain HTML+ERB (Without Framework)
After installing the gem, insert this to the top of your .html.erb files:

```html+erb
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<% require 'set' %>
<% require 'apexcharts' %>
<% include ApexCharts::Helper %>
```
`require 'set'` is needed because of an issue in the dependency used, but not needed
in v0.2.x release of ApexCharts.rb.

You can then generate the static html page with e.g.
```bash
$ erb sample.html.erb > sample.html
```


## TODO
- v0.1.x
  - Add more features (e.g. gradient line, background image, etc.)
  - Support other ruby frameworks (sinatra, hanami, etc.)
- v0.2.x
  - Replace dependency `smart_kv` with `dry-schema`


## Contributing
Everyone is encouraged to help improve this project by:
- Reporting bugs
- Fixing bugs and submiting pull requests
- Fixing documentation
- Suggesting new features
- Implementing TODO above


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## Like the charts?
Consider donating to the author of apexcharts.js to support his awesome library.
This project wouldn't be possible without it.

Become a sponsor on [Patreon](https://patreon.com/junedchhipa).  
One time donation on [PayPal](https://paypal.me/junedchhipa)
