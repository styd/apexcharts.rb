# frozen_string_literal: true

RSpec.describe ApexCharts::Charts::SyncingCharts do
  let(:apexcharts_group) { 'chart-group-1' }
  let(:line_data) {
    [[100, 1], [200, 2]]
  }
  let(:area_data) {
    [[200, 2], [300, 3]]
  }
  let(:options) { {} }
  let(:line_options) { {height: 500} }
  let(:area_options) { {height: 300} }
  let(:sync_options) { {group: apexcharts_group} }

  it 'assigned properties correctly' do
    outer_self = binding
    %i[apexcharts_group apexcharts_id line_data line_options area_data area_options].each do |m|
      outer_self.define_singleton_method m, &method(m)
    end

    expect(ApexCharts::Charts::LineChart).to(
      receive(:new).with(nil, line_data, { id: 'chart-1' }.merge(sync_options).merge(line_options))
                   .and_call_original
    )
    expect(ApexCharts::Charts::AreaChart).to(
      receive(:new).with(nil, area_data, { id: 'chart-2' }.merge(sync_options).merge(area_options))
                   .and_call_original
    )

    chart = described_class.new(outer_self, options) do
      line_chart(line_data, line_options)
      area_chart(area_data, area_options)
    end

    expect(chart.instance_variable_get(:@options)).to eq(sync_options)
  end
end
