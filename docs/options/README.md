## Options

ApexCharts.RB supports [all options from ApexCharts.JS](https://apexcharts.com/docs/options/),
but instead of *camelCase*, you can write them in *snake_case*.

ApexCharts.RB also provides shortcuts to some ApexCharts.JS options, such as `title`. In
ApexCharts.JS you would have to write

```ruby
title: { text: "Some title" }
```
In ApexCharts.RB you can write
```ruby
title: "Some title"
```
if you just want to add the text.

`xtitle` and `ytitle` are even greater shortcuts. Instead of
```ruby
xaxis: { title: { text: "x title" } }
```
you can write
```ruby
xtitle: "x title"
```

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
