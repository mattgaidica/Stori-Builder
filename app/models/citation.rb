class Citation < ApplicationRecord
  require 'anystyle'
  belongs_to :source

  def title
    parsed = AnyStyle.parse(self.cited_as)
    return parsed[0][:title][0]
  end

  def link
    base_url = 'https://www.google.com/search?q='
    query = base_url + CGI.escape(self.title) + '&btnI'
  end
end
