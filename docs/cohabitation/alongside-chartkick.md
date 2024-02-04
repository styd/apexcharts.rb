### Alongside Chartkick

Given:

```erb
<% series = [
  {name: 'Verified', data: @verified_users},
  {name: 'Unverified', data: @unverified_users}
] %>
<% options = {
  legend: 'bottom', title: 'Users Grouped By Week For The Last 1 Year',
  ytitle: 'Users', width: '100%', height: '300px'
} %>
```

#### Chartkick (Chart.js) and ApexCharts

```erb
<div style="display: inline-block; width: 48%;">
  <%= area_chart(series, {**options, adapter: 'chartjs'}) %>
</div>
<div style="display: inline-block; width: 48%;">
  <%= apex_area_chart(series, options) %>
</div>
```

![Chartkick (Chart.js) And ApexCharts](../charts/chartkick-chartjs-and-apexcharts.gif)

#### Chartkick (Google Charts) and ApexCharts

```erb
<div style="display: inline-block; width: 48%;">
  <%= area_chart(series, {**options, adapter: 'google'}) %>
</div>

<div style="display: inline-block; width: 48%;">
  <%= apex_area_chart(series, options) %>
</div>
```

![Chartkick (Google Charts) And ApexCharts](../charts/chartkick-google-and-apexcharts.gif)

#### Chartkick (Highcharts) and ApexCharts

```erb
<div style="display: inline-block; width: 48%;">
  <%= area_chart(series, {**options, adapter: 'highcharts'}) %>
</div>

<div style="display: inline-block; width: 48%;">
  <%= apex_area_chart(series, options) %>
</div>
```

![Chartkick (Highcharts) And ApexCharts](../charts/chartkick-highcharts-and-apexcharts.gif)

