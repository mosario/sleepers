class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
 	validates :title, presence: true,
                    length: { 
                    	minimum: 3,
                    	too_short: "Меньше допустимой длины"
                    }      
end
