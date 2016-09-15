class Playlist < ApplicationRecord
  prepend DeleteWithAttachments

  belongs_to :user
  has_many :playlist_entities, dependent: :destroy
  has_many :tracks, through: :playlist_entities
  dragonfly_accessor :artwork

  validates :user_id,
            presence: true

  validates :soundcloud_id,
            presence: true,
            uniqueness: true

  validates :title,
            presence: true,
            length: { maximum: 50 }

  validates_size_of :artwork,
                    maximum: 3.megabytes

  validates_property :ext,
                     of: :artwork,
                     as: 'jpg'
end
