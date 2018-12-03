class PagesController < ApplicationController
  def dashboard
  end

  def reading
    @citations_read = Citation.where(is_read: true).order(updated_at: :desc)
    @citations_unread = Citation.where(is_read: false).order(:created_at)
  end
end