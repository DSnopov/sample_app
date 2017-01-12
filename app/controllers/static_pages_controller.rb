class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
      @microposts = current_user.microposts.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
