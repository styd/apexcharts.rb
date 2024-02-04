### Global Options

To use default options globally, you can specify config for default options before calling
your charts. In Rails, put it in `initializers` directory. For example:

```ruby
# config/initializers/apexcharts.rb

ApexCharts.config.default_options = {
  data_labels: false,
  tootip: true,
  theme: 'my-theme'
}
```

All charts will then automatically pick up these global options, which can be overwritten
individually by any options passed to the relevant chart helper.
