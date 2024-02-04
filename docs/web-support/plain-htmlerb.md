### Plain HTML+ERB (Without Framework)

Insert this to the top of your .html.erb files:

```erb
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<% require 'apexcharts' %>
<% include ApexCharts::Helper %>
```

You can then generate the static html page with e.g.

```bash
$ erb sample.html.erb > sample.html
```
