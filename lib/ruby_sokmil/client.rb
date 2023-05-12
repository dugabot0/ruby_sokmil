require "faraday"
require_relative "response"
require_relative "version"

module RubySokmil
  class Client
    BASE_URL             = "https://sokmil-ad.com/api/v1/".freeze
    DEFAULT_AFFILIATE_ID = "20131-001".freeze

    def initialize(options = {})
      @api_key      = (ENV["SOKMIL_API_ID"]       || options[:api_key])
      @affiliate_id = (ENV["SOKMIL_AFFILIATE_ID"] || options[:affiliate_id]  || DEFAULT_AFFILIATE_ID)
    end

    API_MAP = {
      item:     'Item',      # 商品検索
      maker:    'Maker',     # メーカー検索
      label:    'Label',     # レーベル検索
      series:   'Series',    # シリーズ検索
      genre:    'Genre',     # ジャンル検索
      director: 'Director',  # 監督検索
      actor:    'Actor',     # 出演者検索
    }.freeze

    API_MAP.each do |method, path|
      define_method method do |params = {}|
        get(path, must.merge(params))
      end
    end

    private

    def must
      {
        api_key: @api_key,
        affiliate_id: @affiliate_id,
        output: "json"
      }
    end

    def get(path, options = {})
      Response.new(connection.get(path, options))
    end

    def connection
      @connection ||= Faraday.new(faraday_options) do |faraday|
        faraday.adapter  :net_http
        faraday.request  :url_encoded
        faraday.response :json
      end
    end

    def faraday_options
      {
        url: BASE_URL
      }
    end
  end
end
