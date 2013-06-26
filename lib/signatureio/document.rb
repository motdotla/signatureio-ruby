module Signatureio
  class Document
    # 
    # Api calls
    # 
    def self.create(attrs={})
      response = Signatureio.request.post "documents.json", attrs
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end

    def self.retrieve(id=nil)
      response = Signatureio.request.get "documents/#{id}.json"
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end

    def self.pages(id=nil)
      response = Signatureio.request.get "documents/#{id}/pages.json"
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end

    def self.all
      response = Signatureio.request.get "documents.json"
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end
  end
end
