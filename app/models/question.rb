class Question < ApplicationRecord
  belongs_to :survey
  has_many :answers
  accepts_nested_attributes_for :answers
  before_destroy :destroy_answers

  private
  def destroy_answers
    @answer = Answer.where(question_id: self.id)
    @answer.destroy_all
  end
end
