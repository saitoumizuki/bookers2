class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
	has_many :books
	attachment :profile_image
	validates :name, {presence: true, length: {in: 2..20}}
	validates :introduction, length: {maximum: 50}

	def books
		return Book.where(user_id: self.id)
	end
end
