class PositionsController < ApplicationController
  respond_to :html, :json

  def index
    if params["issue"]
      input = params["issue"].delete("\n").strip
      issue = Issue.find_by_description input
      @positions = issue.positions
    else
      @positions = Position.all
    end

    respond_with @positions
  end

  def show
  end
end