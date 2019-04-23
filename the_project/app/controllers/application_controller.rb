class ApplicationController < ActionController::Base
    def search
        if params[:search]
            print params[:search];
            @search_result = Search.execute(params[:search]);
        end
    end
end
