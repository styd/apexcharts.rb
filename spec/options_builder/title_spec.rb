# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'title options' do
  let(:sample) { nil }
  let(:ob) {
    ApexCharts::OptionsBuilder.new(sample, options)
  }

  context 'string title' do
    let(:options) {
      {
        title: 'Which title?'
      }
    }
    let(:expected_built) {
      {
        title: {
          text: 'Which title?'
        }
      }
    }

    it 'adds shape key with the string as the value' do
      ob.build_title
      expect(ob.built).to match(expected_built)
    end
  end

  context 'hash title' do
    let(:options) {
      {
        title: {
          text: 'This title.',
          offset_x: 10
        }
      }
    }
    let(:expected_built) {
      {
        title: {
          text: 'This title.',
          offsetX: 10
        }
      }
    }

    it 'only camelizes the hash' do
      ob.build_title
      expect(ob.built).to match(expected_built)
    end
  end
end

RSpec.describe '#build_title' do
  after do
    ApexCharts.config.schema = :default
  end

  context 'schema dry_schema' do
    it_behaves_like 'title options' do
      before do
        ApexCharts.config.schema = :dry_schema
      end
    end
  end

  context 'schema smart_kv' do
    it_behaves_like 'title options' do
      before do
        ApexCharts.config.schema = :default
      end
    end
  end
end
