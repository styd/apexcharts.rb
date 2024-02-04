### Formatter Function

To use a _simple_ formatter function (e.g. formatter in `tooltip`, `data_labels`, and `labels`),
you can add [functionable-json](https://github.com/styd/functionable-json) to your Gemfile and
use it like so:

```erb
<%= area_chart series, tooltip: {y: {formatter: function(val) { return '$' + parseFloat(val).toLocaleString() }}} %>
```

Or, without the _functionable-json_ gem, use function as object as follows:

```erb
<%= area_chart series, tooltip: {y: {formatter: {function: {args: "val", body: "return '$' + parseFloat(val).toLocaleString();"}} }} %>
```
