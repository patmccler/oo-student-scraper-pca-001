class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each do |k,v|
      send("#{k}=", v)
    end
    save
  end

  def save
    tap { |student| @@all << student }
  end

  def self.create_from_collection(students_array)
    students_array.each do |student|
      new(student)
    end
  end

  def self.all
    @@all
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |k,v|
      send("#{k}=", v)
    end
  end
end
