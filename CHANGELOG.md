# Changelog
All notable changes to this project will be documented in this file.

## [0.2.0] - 2022-02-28
### Added
- Option to render chart with a script whose type is module
- Allow multiple Y-Axis

### Changed
- ApexCharts.JS version from 3.27.3 to 3.33.0

### Removed
- Schemas (smart_kv and dry-schema)

## [0.1.11] - 2021-08-15
### Added
- Alternative options schema :dry_schema
- **Box Plot chart**

### Changed
- Make obsolete previously deprecated local palette creation
- Update options schema to match ApexCharts.JS version 3.27.3
- ApexCharts.JS version from 3.21.0 to 3.27.3

## [0.1.10] - 2020-10-04
### Added
- Option to defer chart rendering
- ApexCharts.RB release version in source (in script attribute)
- A lot of new optional attributes for annotations, chart, dataLabels,
  legend, markers, plotOptions, theme, xAxis, and yAxis

### Changed
- Local palette with public API `create_palette` and `destroy_palette`
  is deprecated
- Make obsolete previously deprecated require directory for `prefix_with_apex`
- ApexCharts.JS version from 3.18.0 to 3.21.0

### Fixed
- function as object 'body' attribute that contains double quote (")
  converted incorrectly


## [0.1.9] - 2020-04-05
### Added
- Support for function as object.
  The following hash:

  ```
    ...
    formatter: {function: {args: "a,b", body: "return a + b;"}}
    ...
  ```

  will become:

  ```
    ...
    "formatter":function(a,b) {return a + b;}
    ...
  ```

- Frozen string literal comment on several files

### Changed
- ApexCharts.JS version from 3.10.1 to 3.18.0
- Upgrade yarn package for rails example

### Fixed
- FrozenError on input colors
- uninitialized constant SmartKv::Meat::Set when using plain ERB


## [0.1.8] - 2019-11-13
### Added
- Example for rails app
- Support for reversed Y-Axis

### Changed
- ApexCharts.JS version from 3.8.6 to 3.10.1

### Fixed
- Documentation of Installation on Rails
- Uninitialized constant `ApexCharts::Helper::MixedCharts`
- Uninitialized constant `ApexCharts::Helper::SyncingCharts`
- Mixed charts not showing because of options type value of `null`
- No methods `apexcharts_id` on `ApexCharts::MixedCharts`
- No methods `apexcharts_group` on `ApexCharts::SyncingCharts`


## [0.1.7] - 2019-09-28
### Added
- Support for Sinatra
- Ability to prefix chart helper names. This will allow using ApexCharts.RB
  alongside other charting libraries.

### Changed
- ApexCharts.JS version from 3.8.4 to 3.8.6
- Update options schema to match ApexCharts.JS
- Charts and series are autoloaded instead of required to prevent loading
  unused charts and series to load path

### Fixed
- Empty data series throwing 'undefined method' error
- Bubble series returning original hash


## [0.1.6] - 2019-08-24
### Added
- Security section in repo page
- Table of Contents
- Ability to create reusable theme palette
- **RangeBar chart**
- Change logo to placeholder logo that needs to be replaced
- Example for palette creation
- Choose README versions

## Changed
- X and Y axis type `number` to `numeric`
- ApexCharts.JS version from 3.6.12 to 3.8.4

### Fixed
- HTML+ERB wrong and ambiguous instruction
- Cannot specify xtype or ytype as root options


## [0.1.5] - 2019-07-20
### Added
- Data formats on README
- HTML+ERB support on README
- BaseChart as a parent for CartesianChart and PolarChart
- Tests for OptionsBuilder
- Option `parentHeightOffset` for `chart`
- Option `radar` for `plot_options`
- **Radar chart**
- **Candlestick chart**
- Development dependency `simplecov` and `simplecov-console`
- Issue templates
- Code of conduct
- Build options for colors

### Changed
- Gem summary and description
- Namespace Apexcharts to ApexCharts

### Fixed
- Array of hashes with key `data` as input not read correctly
- `plot_options` not deeply merged on bar and column chart when
  `options` contains `plot_options`
- Undefined method `to_json` for `options` when not using Rails
- Utils::Hash.camelize_keys not camelizing keys of hash in array
  value


## [0.1.4] - 2019-07-06
### Added
- Changelog
- **Heatmap chart**
- **Bubble chart**
- Chart examples

### Changed
- `mixed_chart`, `combo_chart`, `syncing_chart`, and
  `synchronized_chart` into `mixed_charts`, `combo_charts`,
  `syncing_charts`, and `synchronized_charts` respectively
  as they should be

### Fixed
- Two points with same x value merging into one


## [0.1.3] - 2019-06-29
### Added
- Tests for Utils
- Tests for Charts
- Tests for Options Builder
- **Stepline chart**
- **Brush chart**

### Changed
- Chart examples

### Fixed
- Timezone inconsistency in local and CI when parsing Date


## [0.1.2] - 2019-06-18
### Added
- Travis CI
- **Donut chart**
- **Pie chart**
- **Radial Bar chart**
- Chart examples
- Logo

### Changed
- Chart examples

### Fixed
- Bar chart y as x issue
- Series and options mutations


## [0.1.1] - 2019-06-14
### Added
- **Line chart**
- **Area chart**
- **Column chart**
- **Bar chart**
- **Scatter chart**
- **Mixed charts**
- **Syncing charts**

[Unreleased]: https://github.com/styd/apexcharts.rb/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/styd/apexcharts.rb/compare/v0.1.11...v0.2.0
[0.1.11]: https://github.com/styd/apexcharts.rb/compare/v0.1.10...v0.1.11
[0.1.10]: https://github.com/styd/apexcharts.rb/compare/v0.1.9...v0.1.10
[0.1.9]: https://github.com/styd/apexcharts.rb/compare/v0.1.8...v0.1.9
[0.1.8]: https://github.com/styd/apexcharts.rb/compare/v0.1.7...v0.1.8
[0.1.7]: https://github.com/styd/apexcharts.rb/compare/v0.1.6...v0.1.7
[0.1.6]: https://github.com/styd/apexcharts.rb/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/styd/apexcharts.rb/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/styd/apexcharts.rb/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/styd/apexcharts.rb/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/styd/apexcharts.rb/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/styd/apexcharts.rb/releases/tag/v0.1.1
