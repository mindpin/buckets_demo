class Bucket
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :description, type: String

  has_and_belongs_to_many :posts
end
