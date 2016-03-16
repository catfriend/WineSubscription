class PublicationsController < ApplicationController
  before_filter :check_for_subscription, only: :show
  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def check_for_subscription
    unless current_user.subscription.active
      flash[:alert] = "You must be a subscriber to access this content."
      redirect_to publications_path    
    end 
  end
end