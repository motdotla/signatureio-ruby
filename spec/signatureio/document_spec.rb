require 'spec_helper'

describe Signatureio::Document do
  let(:subject)   { Signatureio::Document }
  let(:url)       { "https://www.signature.io/pdfs/sign-below.pdf" }

  context "incorrect secret api key" do
    before do
      Signatureio.secret_api_key = "incorrect_secret_api_key"
    end

    describe "attempt .create" do
      before do
        @response = subject.create({:url => url})
      end

      it do
        @response.success.should be_false
        @response.error.message.should_not be_empty
      end
    end

    describe "attempt .retrieve" do
      before do
        @response = subject.retrieve("1234")
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

    describe ".create" do
      before do
        @response = subject.create(attrs)
      end

      context "default" do
        let(:attrs) { {:url => url} }

        it do
          @response.success.should be_true
          @response.document.id.should_not be_empty
        end
      end

      context "blank url" do
        let(:attrs) { {:url => nil} }

        it do 
          @response.success.should be_false
          @response.error.message.should_not be_empty
        end
      end

      context "invalid url" do
        let(:attrs) { {:url => "noexisturl"} }

        it do 
          @response.success.should be_false
          @response.error.message.should_not be_empty
        end
      end
    end

    describe ".retrieve" do
      before do
        response = subject.create({:url => url})
        @id = response.document.id
      end

      context "default" do
        before do
          @response = subject.retrieve(@id)
        end
        
        it do
          @response.success.should be_true
          @response.document.id.should eq @id
        end
      end

      context "incorrect id" do
        before do
          @response = subject.retrieve("1234")
        end

        it do
          @response.success.should be_false
          @response.error.message.should_not be_empty
        end
      end
    end

    describe ".all" do
      before do
        @response = subject.all
      end

      context "default" do
        it do
          @response.success.should be_true
          @response.documents.count.should >= 1
        end
      end
    end
  end
end