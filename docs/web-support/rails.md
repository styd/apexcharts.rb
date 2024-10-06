### Rails

Require it in your `app/assets/javascripts/application.js`.
```js
//= require apexcharts
```

Or, if you use `webpacker`, you can run:
```bash
$ yarn add apexcharts
```
and then require it in your `app/javascript/packs/application.js`.
```js
// AMD
window.ApexCharts = require("apexcharts") // expose to window

// or
// ES6
import ApexCharts from 'apexcharts'
window.ApexCharts = ApexCharts
```

Or, if you use `importmaps', you can:

1. Download to local vendor directory (optional but recommended)

```bash
$ wget -O vendor/javascript/apexcharts.esm.js https://ga.jspm.io/npm:apexcharts@3.54.0/dist/apexcharts.esm.js
```

2. Pin "apexcharts" in `config/importmap.rb` to local esm file if you did No. 1:

```ruby
pin "apexcharts", to: "apexcharts.esm.js"
```

or, to CDN URL directly if you didn't do No. 1:

```ruby
pin "apexcharts", to: "https://ga.jspm.io/npm:apexcharts@3.54.0/dist/apexcharts.esm.js"
```

3. Import and assign to window in `app/javascript/application.js`

```js
import ApexCharts from "apexcharts"
window.ApexCharts = ApexCharts
```

4. Use it with options `module: true`

For example:

```erb
<% series = [{
    name: "Desktops",
    data: [10, 41, 35, 51, 49, 62, 69, 91, 148]
  }]
  options = {
    module: true
  }
%>
<%= line_chart(series, options) %>
```
