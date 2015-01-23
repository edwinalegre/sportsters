class Sportster
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :age, type: Integer
  field :birth_date, type: Date
  field :division, type: String
  field :shirt_size, type: String
  field :short_size, type: String
  mount_uploader :profile_image, SportsterprofileUploader

  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true


end
