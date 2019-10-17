class Citation < ApplicationRecord
  require 'anystyle'
  belongs_to :source, optional: true
  default_scope { order(created_at: :desc) }

  def self.unread_sources
    self.where.not(source_id: nil, is_read: true).map{|x| x.source}.uniq
  end

  def title
    parsed = AnyStyle.parse(self.cited_as)
    begin
      return parsed[0][:title][0]
    rescue
      return self.cited_as
    end
  end

  def link
    base_url = 'https://www.google.com/search?q='
    query = base_url + CGI.escape(self.title) + '&btnI'
  end
end
