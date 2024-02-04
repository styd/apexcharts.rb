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
