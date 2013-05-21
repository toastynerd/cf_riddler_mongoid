class Question
  include Mongoid::Document
  field :ask, type: String
  field :detail, type: String
  field :answer, type: String

  validates_presence_of :ask

  has_and_belongs_to_many :users 
end
