# frozen_string_literal: true

RSpec.describe ApexCharts::Utils::Hash do
  context '.deep_merge' do
    let(:hash_a) {
      {
        a: {
          b: {
            c: '3',
            d: 4
          },
          e: 'five'
        },
        f: :six
      }
    }

    let(:hash_b) {
      {
        a: {
          b: {
            d: 'four'
          },
          e: 'six',
          f: 'seven'
        },
        g: 7
      }
    }

    it 'does nested merge' do
      expect(described_class.deep_merge(hash_a, hash_b)).to eq(
        a: {
          b: {
            c: '3',
            d: 'four'
          },
          e: 'six',
          f: 'seven'
        },
        f: :six,
        g: 7
      )
    end
  end

  context '.camelize' do
    it 'camelize string or symbol and return symbol' do
      expect(described_class.camelize('oss_project')).to eq :ossProject
      expect(described_class.camelize(:justin_bieber)).to eq :justinBieber
    end
  end

  context '.camelize_keys' do
    it 'camelizes keys of the hash' do
      expect(described_class.camelize_keys(
        check_this_out: {
          'this_is_great' => 'cool'
        }
      )).to eq(
        checkThisOut: {
          thisIsGreat: 'cool'
        }
      )
    end

    context 'when the value is an array containing hash' do
      it 'also camelizes keys of the hash inside array' do
        expect(described_class.camelize_keys(
          check_this_out: [
            {
              'this_is_great' => 'cool'
            }
          ]
        )).to eq(
          checkThisOut: [
            {
              thisIsGreat: 'cool'
            }
          ]
        )
      end
    end
  end
end
