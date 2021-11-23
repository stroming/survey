class User < ApplicationRecord
    has_many :surveys
    before_save {self.email = email.downcase}
    before_destroy :destroy_surveys
    VALID_EMAIL_REGEX = /\A^(.+)@(.+)$\z/
    VALID_USERNAME_REGEX = /\A[0-9]*|[A-Za-z]*\z/

    # Username Validation is here:
    validates :username, 
        presence: true, 
        uniqueness: { case_sensitive: false }, 
        length: {minimum: 3, maximum: 50}, 
        format: { with: VALID_USERNAME_REGEX, message: 'Please use only the following characters: ":a-z, A-Z, 0-9, ., _ ".'}
    # inclusion: { in: VALID_USERNAME_REGEX}
    
    # email Validation is here:
    validates :email, 
        presence: true, 
        uniqueness: { case_sensitive: false }, 
        length: {minimum: 3, maximum: 50}, 
        format: { with: VALID_EMAIL_REGEX, message: 'Please enter a valid email address.'}
    
    # password Validation is here:
    has_secure_password

    private

    def destroy_surveys
        @survey = Survey.where(user_id: self.id)
        @survey.destroy_all
    end
end
