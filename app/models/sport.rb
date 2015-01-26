class Sport
  include Mongoid::Document
  field :type, type: String
  field :year, type: String
  field :division, type: String
  field :status, type: String

  validates :type, :year, :division, :status, presence: true
end
