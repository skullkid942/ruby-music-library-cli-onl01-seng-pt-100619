module Findable 
  module ClassMethods
    def self.find_by_name(name)
      @@all.find{|x| x.name == name}
    end
  end
  
  module InstanceMethods
    def self.find_or_create_by_name(name)
      if self.find_by_name(name) == nil 
        self.create_by_name(name)
      else
        self.find_by_name(name)
      end
      self.find_by_name(name) || self.create_by_name(name)
    end
  end
    
end