require_relative './service'
module Adyen


  class DataProtection < Service
    attr_accessor :service, :version
    DEFAULT_VERSION = 1

    def initialize(client, version = DEFAULT_VERSION)
      @service = "DataProtection"
      @client = client
      @version = version
    end

    def request_subject_erasure(request, headers: {} )
      """
      Submit a Subject Erasure Request.
      """
      endpoint = "/requestSubjectErasure".gsub(/{.+?}/, '%s') 
      endpoint = endpoint.gsub(/^\//, "")
      endpoint = endpoint % []
      
      action = { method: "post", url: endpoint}
      @client.call_adyen_api(@service, action, request, headers, @version)
    end

  end
end