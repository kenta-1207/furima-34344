class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
  end
  
  def new
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
