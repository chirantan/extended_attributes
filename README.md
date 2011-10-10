# Extended Attributes – objectize your model attributes in ActiveRecord

How often do you have to have an instance method implemented in a model but only to work with just 1 attribute?

```ruby 
class User < ActiveRecord::Base

  def first_name
    name.split(' ').first
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
module NameMethods

  def first
    split(' ').first
  end
  
  def last
    split(' ').last
  end

end

class User < ActiveRecord::Base

  extend_attribute :name, :extend => NameMethods
  
end
```

### Why?

Extending attributes adds modularity to your design, better object orientation and makes interfaces clean.

### Dealing with Fixnum

[Fixnums cannot have singleton methods](www.ruby-forum.com/topic/50170). Thus, if you try to extend an attribute that is a Fixnum, the whole behavior will be `include`d on Fixnum class, which means that the same behavior will be available on all instances of Fixnum throughout your application. So be careful with them.

### Note

This gem was developed because I liked it and it serves my purpose. Feel free to add to it. I’ll be happy to accept pull requests.