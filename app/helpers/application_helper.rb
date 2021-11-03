module ApplicationHelper

  def user_avatar(user, size = 40)
    if user.avatar.attached?
      user.avatar
    else
      gravatar_image_url(user.emails, size: size)
    end
  end
end
