require 'spec_helper'
require 'date'
require 'time'

RSpec.describe ApexCharts::Utils::DateTime do
  context ".convert" do
    let(:converted) { described_class.convert(input) }

    context 'input is a Time' do
      let(:input) { Time.iso8601("2019-06-18T20:20:20+0700") }

      it 'converts correctly' do
        expect(converted).to eq 1560864020000
      end
    end

    context 'input is a DateTime' do
      let(:input) { DateTime.iso8601("2019-06-18T20:20:20+0700") }

      it 'converts correctly' do
        expect(converted).to eq 1560864020000
      end
    end

    context 'input is a Date' do
      let(:input) { Date.iso8601("2019-06-18T00:00:00+07:00") }

      before do
        ENV["TZ"] = "UTC"
      end

      after do
        ENV["TZ"] = nil
      end

      it 'converts correctly' do
        expect(converted).to eq 1560816000000
      end
    end

    context 'input is a string of DateTime' do
      let(:input) { "2019-06-18T20:20:20+07:00" }

      it 'converts correctly' do
        expect(converted).to eq 1560864020000
      end
    end

    context 'input is a string of Date' do
      let(:input) { "2019-06-18" }

      before do
        ENV["TZ"] = "UTC"
      end

      after do
        ENV["TZ"] = nil
      end

      it 'converts correctly' do
        expect(converted).to eq 1560816000000
      end
    end

    context 'input is anything else' do
      let(:input) { "2" }

      it 'converts correctly' do
        expect(converted).to eq "2"
      end
    end
  end

  context ".convert_range" do
    let(:converted) { described_class.convert_range(input) }

    context 'input is a Time' do
      let(:input) { Time.iso8601("2019-06-08T10:10:10+0700")..Time.parse("2019-06-18 20:20:20 +0700") }

      it 'converts correctly' do
        expect(converted).to eq 1559963410000..1560864020000
      end
    end

    context 'input is a DateTime' do
      let(:input) { DateTime.iso8601("2019-06-08T10:10:10+0700")..DateTime.parse("2019-06-18T20:20:20+0700") }

      it 'converts correctly' do
        expect(converted).to eq 1559963410000..1560864020000
      end
    end

    context 'input is a Date' do
      let(:input) { Date.iso8601("2019-06-08")..Date.parse("2019-06-18") }

      before do
        ENV["TZ"] = "UTC"
      end

      after do
        ENV["TZ"] = nil
      end

      it 'converts correctly' do
        expect(converted).to eq 1559952000000..1560816000000
      end
    end

    context 'input is a string of DateTime' do
      let(:input) { "2019-06-08T10:10:10+07:00".."2019-06-18T20:20:20+07:00" }

      it 'converts correctly' do
        expect(converted).to eq 1559963410000..1560864020000
      end
    end

    context 'input is a string of Date' do
      let(:input) { "2019-06-08".."2019-06-18" }

      before do
        ENV["TZ"] = "UTC"
      end

      after do
        ENV["TZ"] = nil
      end

      it 'converts correctly' do
        expect(converted).to eq 1559952000000..1560816000000
      end
    end

    context 'input is anything else' do
      let(:input) { ["2"] }

      it 'converts correctly' do
        expect(converted).to eq ["2"]
      end
    end
  end

  context '.type' do
    let(:type) { described_class.type(input) }

    context 'input is a Time' do
      let(:input) { Time.iso8601("2019-06-18T20:20:20+0700") }

      it 'converts correctly' do
        expect(type).to eq 'datetime'
      end
    end

    context 'input is a DateTime' do
      let(:input) { DateTime.iso8601("2019-06-18T20:20:20+0700") }

      it 'converts correctly' do
        expect(type).to eq 'datetime'
      end
    end

    context 'input is a Date' do
      let(:input) { Date.iso8601("2019-06-18") }

      it 'converts correctly' do
        expect(type).to eq 'datetime'
      end
    end

    context 'input is a string of DateTime' do
      let(:input) { "2019-06-18T20:20:20+07:00" }

      it 'converts correctly' do
        expect(type).to eq 'datetime'
      end
    end

    context 'input is a string of Date' do
      let(:input) { "2019-06-18" }

      it 'converts correctly' do
        expect(type).to eq 'datetime'
      end
    end

    context 'input is anything else' do
      let(:input) { ["2"] }

      it 'converts correctly' do
        expect(type).to eq 'numeric'
      end
    end
  end
end
