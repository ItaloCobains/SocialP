class BoardsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  def new
    @user = current_user
  end
end
