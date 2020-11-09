require 'date'

class User
    attr_reader :name, :date_of_birth

    def initialize(name, date_of_birth)
        @name = name
        @date_of_birth = date_of_birth
    end

    def age
        ((Date.today - @date_of_birth) / 365.25).to_i
    end

    def next_birthday
        if(@date_of_birth.month == Date.today.month) && (@date_of_birth.day < Date.today.day)
            Date.new(Date.today.year, @date_of_birth.month, @date_of_birth.day)
        elsif (@date_of_birth.month > Date.today.month)
            Date.new(Date.today.year, @date_of_birth.month, @date_of_birth.day)
        else
            Date.new(Date.today.year + 1, @date_of_birth.month, @date_of_birth.day)
        end
    end
end

tests = [
    Date.new(1986, 1, 1),
    Date.new(1988, Date.today.month, Date.today.day), 
    Date.new(1990, 12, 30)
]

puts "====== ages ======"
tests.each do |date|
    puts "#{date}=> #{User.new("Test", date).age}"
end

puts "====== birthdays ======"

tests.each do |date|
    puts "#{date}=> #{User.new("Test", date).next_birthday}"
end