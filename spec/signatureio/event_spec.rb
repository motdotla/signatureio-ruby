require 'spec_helper'

describe Signatureio::Event do
  let(:subject)   { Signatureio::Event }
  let(:url)       { "https://www.signature.io/pdfs/sign-below.pdf" }

  context "incorrect secret api key" do
    before do
      Signatureio.secret_api_key = "incorrect_secret_api_key"
    end

    describe "attempt .all" do
      before do
        @response = subject.all
      end

      it do
        @response.success.should be_false
        @response.error.message.should_not be_empty
      end
    end
  end

  context "correct secret api key" do
    before do
      Signatureio.secret_api_key = ENV['SIGNATURE_SECRET_API_KEY']
    end

    describe ".all" do
      before do
        @response = subject.all(options)
      end

      context "default" do
        let(:options) { {} }

        it do
          @response.success.should be_true
          @response.events.count.should >= 1
        end
      end

      context "count of 1" do
        let(:options) { {count: 1} }

        it do
          @response.success.should be_true
          @response.events.count.should == 1
        end
      end

      context "type" do
        let(:options) { {type: "nonexistant.type"} }

        it do
          @response.success.should be_true
          @response.events.count.should == 0
        end
      end

      context "offset" do
        let(:options) { {offset: 3} }

        it do
          @response.success.should be_true
          @response.offset.should eq 3
        end
      end
    end
  end
end