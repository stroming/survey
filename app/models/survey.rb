class Survey < ApplicationRecord
    belongs_to :user
    has_many :questions
    accepts_nested_attributes_for :questions
    before_destroy :destroy_questions
    
    # Validation for title
    validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
    
    private
    def destroy_questions
        @question = Question.where(survey_id: self.id)
        @question.destroy_all   
    end
end
