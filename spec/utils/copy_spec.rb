# frozen_string_literal: true

RSpec.describe ApexCharts::Utils::Copy do
  context '.deep_copy' do
    let(:hash) {
      {
        a: {
          b: ['1', '2', {c: '3'}]
        }
      }
    }

    before do
      class DummyClass
        include ApexCharts::Utils::Copy

        def copy_data(hash)
          deep_copy(hash)
        end
      end
    end

    it 'copies hashes and arrays deeply' do
      dc = DummyClass.new
      dup_hash = dc.copy_data(hash)
      hash[:a][:b][2][:c] = 3

      expect(dup_hash.dig(:a, :b, 2, :c)).to eq '3'
    end
  end
end
