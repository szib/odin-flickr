module ApplicationHelper
  def page_title
    if @user.present?
      "#{@user.username} :: Flickr browser"
    else
      'Flickr browser'
    end
  end
end
