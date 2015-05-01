class WelcomeController < ApplicationController
  def index
  end

  def positions
    input = params["issue"].delete("\n").strip
    issue = Issue.find_by(description: input)
    positions = issue.positions
    render json: positions
  end
end