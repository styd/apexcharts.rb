# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ApexCharts::Prefixer do
  around do |tests|
    ApexCharts.helper_prefix = nil
    tests.run
    ApexCharts.helper_prefix = nil
  end

  context 'when ApexCharts.helper_prefix is blank' do
    before do
      class DummyClass
        extend ApexCharts::Prefixer

        with_prefix do
          def dummy; end

          def fake; end
        end
      end
    end

    it 'does not change the methods' do
      expect(
        DummyClass.instance_methods - DummyClass.superclass.instance_methods
      ).to match_array %i[dummy fake]
    end
  end

  context 'when ApexCharts.helper_prefix is not blank' do
    before do
      ApexCharts.helper_prefix = 'super_'

      class SuperDummyClass
        extend ApexCharts::Prefixer

        with_prefix do
          def dummy; end

          def fake; end
        end
      end
    end

    it 'prefixes the methods' do
      expect(
        SuperDummyClass.instance_methods - SuperDummyClass.superclass.instance_methods
      ).to match_array %i[super_dummy super_fake]
    end
  end
end
