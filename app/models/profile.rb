class Profile
  include Mongoid::Document
  field :phone, type: String
  field :mobile_phone, type: String
  field :alternate_email, type: String
  field :address1, type: String
  field :address2, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :country, type: String
  belongs_to :user
end
