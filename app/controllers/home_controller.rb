class HomeController < ApplicationController
    def index
    end

    def selected_subject
      @task = Task.find(params[:id])
    end
end