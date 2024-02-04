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

#### Box Plot Chart

Box plot chart is similar to candlestick chart, only the y value is
an array of 5 members (Minimum-First Quartile-Median-Third Quartile-Maximum):

```ruby
{
  <x value> => [<Min>, <Q1>, <Median>, <Q3>, <Max>],
  <x value> => [<Min>, <Q1>, <Median>, <Q3>, <Max>],
  ...
}
```

or this:

```ruby
[
  [<x value>, [<Min>, <Q1>, <Median>, <Q3>, <Max>]],
  [<x value>, [<Min>, <Q1>, <Median>, <Q3>, <Max>]],
  ...
]
```
