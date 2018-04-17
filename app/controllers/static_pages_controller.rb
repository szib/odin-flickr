class StaticPagesController < ApplicationController
  def index
    unless params[:user].blank?
      if @user = get_flickr_user(params[:user])
        @photos = @user.get_public_photos(page: params[:page], per_page: 42)
        unless @photos.present?
          flash.now[:warning] = "#{@user.username} has no public photos."
        end
      else
        flash.now[:danger] = 'This user does not exists.'
      end
    end
  end

  private

  def get_flickr_user(user)
    begin
      flickr_user = Flickr.people.find_by_username(user).get_info!
    rescue Flickr::ApiError => err
    end

    unless flickr_user.present?
      begin
        flickr_user = Flickr.people.find(user).get_info!
      rescue Flickr::ApiError => err
      end
      end

    flickr_user
  end
end
