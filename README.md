# Extended Attributes
_Add custom behavior to your model attributes in ActiveRecord_

How often do you have to have an instance method implemented in a model but only to work with just 1 attribute?

```ruby 
class User < ActiveRecord::Base

  def first_name
    name.split(' ').first
  end
  
  def about_in(format = :plain)
    case format
    when :plain; about
    when :html; RDiscount.new(about).to_html
    end
  end
  
end 
```

But attributes are also objects at the end of the day right? Should the first_name method belong to the attribute name? With this gem you can extend your attribute by mixing modules with them or having attribute specific methods defined on them. Just like our relationship objects.

In your Gemfile

```ruby 
gem 'extended_attributes'
```


```bash 
$ bundle install
```

and now you can do:

```ruby 
class User < ActiveRecord::Base

  extend_attribute :name do
  
    def first
      split(' ').first
    end
  
    def last
      split(' ').last
    end
  
  end
  
end 
```

And you will be able to do:

```ruby 
user = User.find(:first) 
user.name # John Anderson 
user.name.first # John 
user.name.last # Anderson
```

Additionally, you can also have modules exteded on the attributes

```ruby 
module MarkdownMethods

  def to_html
    RDiscount.new(self).to_html # requies rdiscount gem
  end

end

class User < ActiveRecord::Base

  extend_attribute :about, :extend => MarkdownMethods
  
end

@user.about # _This text should appear italic_
@user.about.to_html # <p><em>This text should appear italic</em></p>\n

```

More examples under examples folder

### Why?

Extending attributes adds modularity to your design, better object orientation and makes interfaces clean.

### Dealing with Fixnum

[Fixnums cannot have singleton methods](http://www.ruby-forum.com/topic/50170). Thus, if you try to extend an attribute that is a Fixnum, the whole behavior will be `include`d on Fixnum class, which means that the same behavior will be available on all instances of Fixnum throughout your application. So be careful with them.

### Note

This gem was developed because I liked it and it serves my purpose. Feel free to add to it. I’ll be happy to accept pull requests.