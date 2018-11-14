class Sumnotes
	include HTTParty
  self.base_uri 'http://api.sumnotes.net'

  debug_output $stdout

  def initialize(account,apikey,file)
    @options = { query: { account: account, apikey: apikey, min_page: 0, max_page: 1000, filter: 'highlight', file: file } }
  end

  def extract
    self.class.post("/v1/extract", @options)
  end
end