class PagesController < ApplicationController
  def dashboard
  end

  def reading
    @citations = Citation.all
  end
end