class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  field :user_id, type: String
  field :commentor, type: String

  embedded_in :article

  validates :body, presence: true

  def date_published
  	created_at.localtime.strftime("%A, %B %-d, %Y at %l:%M %p")
  end
end
