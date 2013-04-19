module Signatureio
  class Event
    # 
    # Api calls
    # 
    def self.all(options={})
      url = ["events.json?"]
      url << "type=#{options[:type]}"     if options[:type]
      url << "count=#{options[:count]}"   if options[:count]
      url << "offset=#{options[:offset]}" if options[:offset]

      url = url.join("&")
      response = Signatureio.request.get url
      RecursiveOpenStruct.new(response.body, :recurse_over_arrays => true)
    end
  end
end
