class Profile
  include AttributeMappable

  def id
    attributes[:soundcloud_user_id]
  end

  def id=(value)
    attributes[:soundcloud_user_id] = value
  end

  def username=(value)
    attributes[:login] = value
  end

  def first_name=(value)
    attributes[:first_name] = value
  end

  def last_name=(value)
    attributes[:last_name] = value
  end

  def avatar_url=(value)
    attributes[:avatar_url] = value
  end

  def access_token=(value)
    attributes[:soundcloud_access_token] = value
  end
end
