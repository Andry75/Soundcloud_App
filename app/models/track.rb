class Track < ApplicationRecord
  prepend DeleteWithAttachments

  belongs_to :user
  has_many :playlist_entities, dependent: :destroy
  has_many :playlists, through: :playlist_entities,
                       dependent: :destroy

  dragonfly_accessor :data_set
  dragonfly_accessor :artwork

  validates :user_id,
            presence: true

  validates :soundcloud_id,
            presence: true,
            uniqueness: true

  validates :title,
            presence: true,
            length: { maximum: 150 }

  validates :genre,
            length: { maximum: 50 }

  validates_size_of :artwork,
                    maximum: 3.megabytes

  validates_size_of :data_set,
                    maximum: 500.megabytes

  def stylized_title
    return title if title.length <= 20
    "#{title.slice(0..20)}..."
  end
end
