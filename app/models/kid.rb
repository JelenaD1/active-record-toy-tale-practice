require 'pry'

class Kid < ActiveRecord::Base
    has_many :purchases
    has_many :toys, through: :purchases

    def make_purchase(toy, quantity)
        Purchase.create(kid: self, toy:toy, quantity: quantity)
    end 

   def all_purchase_info
    purchases.map {|purchase| purchase.info}
   
   end 

   def throw_out(toy)
     t = purchases.find_by(toy: toy)
     t.update(quantity: t.quantity - 1)

   end 

   def throw_all_out(toy)
      purchases.find_by(toy: toy).destroy
   end 
    

end