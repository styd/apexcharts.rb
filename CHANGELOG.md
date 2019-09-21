# Changelog
All notable changes to this project will be documented in this file.


## [Unreleased]
### Added
- Support for Sinatra
- Ability to prefix chart helper names. This will allow using ApexCharts.RB
  alongside other charting libraries.

### Changed
- ApexCharts.JS version from 3.8.4 to 3.8.6
- Update options schema to match ApexCharts.JS
- Charts and series are autoloaded instead of required to prevent loading
  unused charts and series to memory


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
- **RadialBar chart**
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

[Unreleased]: https://github.com/styd/apexcharts.rb/compare/v0.1.6...HEAD
[0.1.6]: https://github.com/styd/apexcharts.rb/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/styd/apexcharts.rb/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/styd/apexcharts.rb/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/styd/apexcharts.rb/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/styd/apexcharts.rb/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/styd/apexcharts.rb/releases/tag/v0.1.1
