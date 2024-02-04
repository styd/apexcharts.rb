## Use Alongside Other Charting Libraries

You can prefix the helper methods name with your chosen words to avoid name clashing with
other charting libraries (e.g. chartkick, google_charts, etc.) you already use. Just set
the `APEXCHARTS_PREFIX` environment variable to a string before you start your app server,
say, 'awesome\_' and then on your views/templates use the chart helpers as `awesome_line_chart`,
`awesome_area_chart`, and so on.

Besides setting the environtment variable, if you just want a quick prefix, you can instead
do this on your _Gemfile_:

```ruby
gem 'apexcharts', require: 'apex_charts/prefix_with_apex'
```

and you'll get `apex_line_chart`, `apex_area_chart`, etc.

The prefix you set only applies to the outer chart helpers. The inner chart helpers is not
prefixed. For example:

```erb
<%= awesome_syncing_chart(syncing_options) do %>
  <% combo_chart(mixed_options) do %>
    <% line_chart(line_series) %>
    <% area_chart(area_series) %>
  <% end %>
<% end %>
```
