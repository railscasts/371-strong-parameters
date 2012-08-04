# RailsCasts Episode #371: Strong Parameters

http://railscasts.com/episodes/371-strong-parameters

Requires Ruby 1.9.2 or higher.


### Commands used in rails console

```
Topic.new(sticky: true)
params = ActionController::Parameters.new(sticky: true)
Topic.new(params)
params.to_hash
```

### Nested Attributes

The `strong_parameters` gem has some support for nested attributes, but the solution wasn't clean enough for me to show in the episode. Here are some notes about it.

In the example app, when creating a topic, it is possible to create a post at the same time. This currently will not work because `posts_attributes` is not permitted to be set. Restricting which parameters can be set on a post is a little tricky. Here's the working code I ended up with.

```ruby
class PermittedParams < Struct.new(:params, :user)
  def topic
    params.require(:topic).permit(*topic_attributes)
  end

  def topic_attributes
    [:name].tap do |attributes|
      attributes << :sticky if user && user.admin?
      attributes << {posts_attributes: {:"0" => post_attributes}}
    end
  end
  
  def post_attributes
    [:content].tap do |attributes|
      attributes << :inline_images if user && user.admin?
    end
  end
end
```

This works because I'm just creating one new post, however it is not dynamic enough to work with multiple records. Maybe if `strong_parameters` allowed a regular expression or a proc to be passed in as a key that would be doable.
