class User < ApplicationRecord
    has_many :surveys, class_name: "survey", foreign_key: "reference_id"
    before_save {self.email = email.downcase}
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
end
