class SearchController < ApplicationController
  def index
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else 
      @search_result = Search.execute(params[:search]).to_a;
    end
  end
end
