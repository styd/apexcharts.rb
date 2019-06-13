<p align="center">
  <img src="https://apexcharts.com/media/apexcharts-logo.png" height="90">
  <span style="font-size: 40px; vertical-align: top; margin-right: 10px;">+</span>
  <img src="https://www.ruby-lang.org/images/header-ruby-logo.png">
</p>

<p align="center">
  <a href="https://github.com/styd/apexcharts.rb/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-brightgreen.svg" alt="License"></a>
  <a href="https://travis-ci.com/styd/apexcharts.rb"><img src="https://api.travis-ci.com/styd/apexcharts.rb.svg?branch=master" alt="build" /></a>
</p>


<p align="center">
  <a href="https://twitter.com/intent/tweet?text=Create%20visualizations%20with%20this%20free%20and%20open-source%20JavaScript%20Chart%20library&url=https://www.apexcharts.com&hashtags=javascript,charts,visualizations,developers,apexcharts"><img src="https://img.shields.io/twitter/url/http/shields.io.svg?style=social"> </a>
</p>

<p align="center">Beautiful and interactive web charts for rubyist.</p>


<p align="center"><img src="https://apexcharts.com/media/apexcharts-banner.png"></p>

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'apexcharts'
```

And then execute:
```bash
$ bundle
```

## Usage

### Cartesian Charts

Example series used for mixable charts:

```ruby
series = [
  {name: "Total", data: @total_users},
  {name: "Verified", data: @verified_users},
  {name: "Unverified", data: @unverified_users}
]
```
To build the data, you can use gem [groupdate](https://github.com/ankane/groupdate).

Example options used for mixable charts:

```ruby
options = {
  title: 'Users Growth',
  subtitle: 'Grouped Per Week',
  xtitle: 'Week', ytitle: 'Users'
}
```

#### Line Chart

```erb
<%= line_chart(series, options) %>
```
![Example Line Chart](images/line_chart.png)

#### Area Chart

```erb
<%= area_chart(series, options) %>
```
![Example Area Chart](images/area_chart.png)

#### Column Chart

```erb
<%= column_chart(series, options) %>
```
![Example Column Chart](images/column_chart.png)

#### Bar Chart

```erb
<%= bar_chart(series, options) %>
```
![Example Bar Chart](images/bar_chart.png)

Yeah, I know. I will fix the Y-Axis datetime issue.

#### Scatter Chart

```erb
<%= scatter_chart(series, options) %>
```
![Example Scatter Chart](images/scatter_chart.png)

#### Annotations

All charts can have annotations, for example:

```erb
<%= line_chart(series, options) do %>
  <% x_annotation(value: ('2019-01-06'..'2019-02-24'), text: "Busy Time", color: 'green') %>
  <% y_annotation(value: 29, text: "Max Properties", color: 'blue') %>
  <% point_annotation(value: ['2018-10-07', 24], text: "First Peak", color: 'magenta') %>
<% end %>
```
![Example Line Chart with Annotations](images/chart_with_annotations.png)

## Web Framework

### Rails

After installing the gem, require it in your `app/assets/javascripts/application.js`.
```js
//= require 'apexcharts'
```

Or, if you use `webpacker`, you can run:
```bash
yarn add apexcharts
```
and then require it in your `app/javascript/packs/application.js`.
```js
require("apexcharts")
```

## Objective
- To bring out as much apexcharts.js capabilities as possible but in ruby ways.

## Roadmap
- Other charts (pie, donut, radar, heatmap, etc.)
- Support other ruby frameworks (sinatra, hanami, etc.)

## Contributing
Everyone is encouraged to help improve this project by:
- Reporting bugs
- Fixing bugs and submiting pull requests
- Fixing documentation
- Suggesting new features

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
