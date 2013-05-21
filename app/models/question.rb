class Question
  include Mongoid::Document
  field :ask, type: String
  field :detail, type: String

  validates_presence_of :ask
end
