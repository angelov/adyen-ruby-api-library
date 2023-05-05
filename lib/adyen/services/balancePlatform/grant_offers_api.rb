require_relative '../service'
module Adyen


  class GrantOffersApi < Service
    attr_accessor :service, :version

    def initialize(client, version = DEFAULT_VERSION)
      @service = "BalancePlatform"
      @client = client
      @version = version
    end

    def get_all_available_grant_offers(headers: {} , queryParams: {})
      """
      Get all available grant offers
      """
      endpoint = "/grantOffers".gsub(/{.+?}/, '%s') 
      endpoint = endpoint.gsub(/^\//, "")
      endpoint = endpoint % []
      endpoint = endpoint + create_query_string(queryParams)
      action = { method: "get", url: endpoint}
      @client.call_adyen_api(@service, action, {}, headers, @version)
    end

    def get_grant_offer(grantOfferId, headers: {} )
      """
      Get a grant offer
      """
      endpoint = "/grantOffers/{grantOfferId}".gsub(/{.+?}/, '%s') 
      endpoint = endpoint.gsub(/^\//, "")
      endpoint = endpoint % [grantOfferId]
      
      action = { method: "get", url: endpoint}
      @client.call_adyen_api(@service, action, {}, headers, @version)
    end

  end
end