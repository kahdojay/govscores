class SigsController < ApplicationController
  respond_to :html, :json

  def show
    @sig = Sig.find params[:id]
    respond_with @sig
  end
end
