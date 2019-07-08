# Changelog
All notable changes to this project will be documented in this file.


## [Unreleased]
### Added
- Data formats on README
- HTML+ERB support on README
- BaseChart as a parent for Cartesian Chart and Polar Chart

### Fixed
- Array of hashes with key `data` as input not read correctly


## [0.1.4] - 2019-07-06
### Added
- Changelog
- Heatmap Chart
- Bubble Chart
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
- Stepline chart
- Brush chart

### Changed
- Chart examples

### Fixed
- Timezone inconsistency in local and CI when parsing Date


## [0.1.2] - 2019-06-18
### Added
- Travis CI
- Donut chart
- Pie chart
- RadialBar chart
- Chart examples
- Logo

### Changed
- Chart examples

### Fixed
- Bar chart y as x issue
- Series and options mutations


## [0.1.1] - 2019-06-14
### Added
- Line chart
- Area chart
- Column chart
- Bar chart
- Scatter chart
- Mixed charts
- Syncing charts

[Unreleased]: https://github.com/styd/apexcharts.rb/compare/v0.1.4...HEAD
[0.1.4]: https://github.com/styd/apexcharts.rb/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/styd/apexcharts.rb/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/styd/apexcharts.rb/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/styd/apexcharts.rb/releases/tag/v0.1.1
