## Reusable Custom Palette

To create palettes to be used anywhere on your any parts of your app, you can use
`ApexCharts::Theme.create`.

For example, in rails app, you would write it in initializers:

```ruby
# config/initializers/apexcharts.rb
ApexCharts::Theme.create "rainbow", ["#ff0000", "#00ff00", "#0000ff"]
```

and later somewhere in your app views:

```ruby
# e.g. app/views/home/index.html.slim
...
= line_chart chart_data, theme: "rainbow"
...
```

If later for some reason I don't know you want to destroy the palette you can use:

```ruby
ApexCharts::Theme.destroy "rainbow"
```
