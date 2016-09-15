class PlaylistInfo
  include AttributeMappable

  def id
    attributes[:soundcloud_id]
  end

  def id=(value)
    attributes[:soundcloud_id] = value
  end

  def title=(value)
    attributes[:title] = value
  end
end
