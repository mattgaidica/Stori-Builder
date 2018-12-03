class PagesController < ApplicationController
  def dashboard
  end

  def reading
    @citations_read = Citation.where(is_read: true)
    @citations_unread = Citation.where(is_read: false)
  end
end