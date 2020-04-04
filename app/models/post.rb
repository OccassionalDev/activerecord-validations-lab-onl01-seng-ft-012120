class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  
  def is_clickbait?
    clickbait = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
      ]
      
      if clickbait.none? do |pattern|
          pattern.match title 
        end 
      
      erros.add(:title, "")
    end 
  end 
end
