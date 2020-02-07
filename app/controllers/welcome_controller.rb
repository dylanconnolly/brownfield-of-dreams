class WelcomeController < ApplicationController
  def index
    if current_user
      classroom_tutorial
    else
      no_classroom_tutorial
    end
  end

  private

  def classroom_tutorial
    @tutorials = if params[:tag]
                   Tutorial
                     .tagged_with(params[:tag])
                     .paginate(page: params[:page], per_page: 5)
                 else
                   Tutorial
                     .all
                     .paginate(page: params[:page], per_page: 5)
                 end
  end

  def no_classroom_tutorial
    @tutorials = if params[:tag]
                   Tutorial
                     .no_classroom
                     .tagged_with(params[:tag])
                     .paginate(page: params[:page], per_page: 5)
                 else
                   Tutorial
                     .no_classroom
                     .paginate(page: params[:page], per_page: 5)
                 end
  end
end
