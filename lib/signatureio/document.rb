module Signatureio
  class Document
    # 
    # Api calls
    # 
    def self.create(attrs={})
      response = Signatureio.request.post "documents.json", attrs
      response.body.to_ostruct_recursive
    end

    def self.retrieve(id=nil)
      response = Signatureio.request.get "documents/#{id}.json"
      response.body.to_ostruct_recursive
    end

    def self.all
      response = Signatureio.request.get "documents.json"
      response.body.to_ostruct_recursive
    end
  end
end
