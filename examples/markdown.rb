
require 'rdiscount'

module MarkdownMethods
  
  def to_html
    RDiscount.new(self).to_html
  end
  
end