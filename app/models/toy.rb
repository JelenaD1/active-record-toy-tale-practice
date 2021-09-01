class Toy < ActiveRecord::Base
    has_many :purchases
    has_many :kids, through: :purchases

    def self.most_expensive
        all.order(price: :desc).first
    end 

    def self.most_popular
        fomo = all.map{|toy| toy.purchases.count}.max 
        all.find{|toy| toy.purchases.count == fomo}    
    end 

    def kids_names
        kids.pluck(:name)
        
    end 

end