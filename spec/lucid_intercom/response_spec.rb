# frozen_string_literal: true

module LucidIntercom
  RSpec.describe Response do
    let(:status_code) { 200 }

    subject(:response) { Response.new(status_code, {}, '{}') }

    it { is_expected.to have_attributes(status_code: status_code) }

    shared_examples 'status code' do |range, error_class|
      context "when status code is within #{range}" do
        let(:status_code) { rand(range) }

        it 'raises an error on #assert!' do
          expect { response.assert! }.to raise_error do |error|
            expect(error).to be_a(error_class)
            expect(error.message).to eq("bad response (#{status_code})")
            expect(error.response.status_code).to be(status_code)
            expect(error.response.headers).to eq({})
            expect(error.response.data).to eq('{}')
            expect(error.response.data_hash).to eq({})
          end
        end
      end
    end

    include_examples 'status code', 400..499, Response::ClientError
    include_examples 'status code', 500..599, Response::ServerError

    context 'with a success status code' do
      let(:status_code) { rand(200..299) }

      it 'assert! returns itself' do
        expect(response.assert!).to be_a(Response)
      end
    end
  end
end
