require 'spec_helper'

RSpec.describe ApexCharts do
  it 'sets helper_prefix as "apex_"' do
    expect(described_class.helper_prefix).to eq nil

    require 'apexcharts/prefix_with_apex'

    expect(described_class.helper_prefix).to eq 'apex_'
  end
end
