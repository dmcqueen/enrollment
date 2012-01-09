class Teacher < User
  has_many :courses
  has_many :periods, :through => :courses
end
