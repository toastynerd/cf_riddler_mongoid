class Question
  include Mongoid::Document
  field :ask, type: String
  field :detail, type: String
end
