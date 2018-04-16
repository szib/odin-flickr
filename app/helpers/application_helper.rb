module ApplicationHelper
  def page_title
    if @user.present?
      "#{@user.username} :: Flickr browser"
    else
      'Flickr browser'
    end
  end

  def brand
    if @user.present?
      title = "@#{@user.username}"
    else
      title = 'flickr browser'
    end
    link_to title, :root, class: 'navbar-brand'
  end

end
