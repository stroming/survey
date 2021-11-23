class Question < ApplicationRecord
  belongs_to :survey
  has_many :answers
  accepts_nested_attributes_for :answers
  after_destroy :destroy_answers

  private
  def destroy_answers
      self.questions.destroy_all   
  end
end
