class IssuesController < ApplicationController
  respond_to :html, :json

  def index
    @issues = Issue.all
    respond_with @issues
  end

  def show
  end
end