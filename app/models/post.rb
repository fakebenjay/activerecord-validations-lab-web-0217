class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category, you insipid fuckhat." }
  validate :clickbait?

  def clickbait?
    clickbait_terms = ["Won't Believe", "Secret", "Guess"]
    if self.title && !clickbait_terms.any? { |c| self.title.include?(c)}
      errors.add(:title, "No YOU'RE fake news!!!")
    end
  end
end
