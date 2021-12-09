class Post < ApplicationRecord
  belongs_to :user
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags
  has_one_attached :post_image
  validate :image_presence
  after_commit :create_hash_tags, on: :create

  def image_presence
    errors.add(:post_image, "can't be blank") unless post_image.attached?
  end
  def create_hash_tags
    extract_name_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end
  def extract_name_hash_tags
    description.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end

end
