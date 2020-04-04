class Author < ActiveRecord::Base
 validates :name, presence: true, uniqueness: true
 validates: :phone_number, length: {is
end
