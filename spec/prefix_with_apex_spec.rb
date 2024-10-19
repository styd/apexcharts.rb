# frozen_string_literal: true

RSpec.describe ApexCharts do
  it 'sets helper_prefix as "apex_"' do
    expect(described_class.helper_prefix).to eq nil

    require 'apex_charts/prefix_with_apex'

    expect(described_class.helper_prefix).to eq 'apex_'
  end
end
