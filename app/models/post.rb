class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true

  after_save :update_user_posts_counter

  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def return_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
