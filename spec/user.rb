
require File.expand_path(File.dirname(__FILE__) + '/date_methods.rb')
require File.expand_path(File.dirname(__FILE__) + '/../lib/extended_attributes.rb')
require File.expand_path(File.dirname(__FILE__) + '/../examples/markdown.rb')
require File.expand_path(File.dirname(__FILE__) + '/../examples/social_profiles.rb')

class User < ActiveRecord::Base
  
  extend_attribute :name do
    def first
      self.split(' ').first
    end
    
    def last
      self.split(' ').last
    end    
  end
  
  extend_attribute :work_experience do 
    
    def in_months
      self * 12
    end
    
  end
  
  extend_attribute :dob, :extend => DateMethods
  extend_attribute :about, :extend => MarkdownMethods
  extend_attribute :username, :extend => SocialProfiles
  
end