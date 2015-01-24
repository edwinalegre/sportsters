class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :category, type: String
  field :status, type: String

  validates :title, :body, :status, :category, presence: true

	def date_published
	  	created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
	end
end
