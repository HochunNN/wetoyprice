class Product < ActiveRecord::Base
    
    def self.change_slash_into_httpslash
        
        a = self.where("product_picture_url like?", "#{"//"}%")
        
        a.each do |k|
           k.product_picture_url =  k.product_picture_url.gsub("//","http://")
           k.save
        end
        
    end
    
end
