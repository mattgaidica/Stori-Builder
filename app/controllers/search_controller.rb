class SearchController < ApplicationController
  # https://github.com/ankane/searchkick#getting-started
  def index
    if params.has_key?(:term)
      @search_term = params[:term];
      @results = Search.for(params[:term])
    end
  end

  def new
    if params.has_key?(:term)
      redirect_to "/search/#{params[:term]}"
    else
      @results = []
      render :index
    end
  end

end