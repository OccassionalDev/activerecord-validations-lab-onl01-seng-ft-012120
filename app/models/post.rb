class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?
  
  def is_clickbait?
    clickbait_list = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
      ]
      
    if clickbait_list.none? { |pattern| pattern.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
