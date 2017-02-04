module AvatarUrlable

  def avatar_url
    if avatar.url
      URI.join(Rails.application.routes.url_helpers.root_url, avatar.url).to_s
    end
  end

end