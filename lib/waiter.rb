require "pry"
class Waiter

    attr_accessor :name, :yrs_experience

    @@all = []
  
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def new_meal(customer, total, tip)
        Meal.new(self, customer , total, tip)
    end 

    def meals
        Meal.all.select { |plate| plate.waiter == self}
    end 

    def best_tipper 
        tip = 0 
        cust = ""
        meals.each do |meal|
           if meal.tip > tip
                tip = meal.tip
                cust = meal.customer
           end
        end
        cust
            
    end 

 
end