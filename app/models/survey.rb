class Survey < ApplicationRecord
    belongs_to :user
    has_many :questions
    accepts_nested_attributes_for :questions

    # Validation for title
    validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
    # Validation for descr:description
    validates :description, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 500}

end
