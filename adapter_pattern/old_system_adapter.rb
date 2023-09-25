The Adapter design pattern is a structural design pattern that allows objects with incompatible interfaces to work together. It acts as a bridge between two incompatible interfaces, making them compatible without changing their source code. In Ruby, you can implement the Adapter pattern in various ways. Here's a simple example:

Let's say you have an existing `OldSystem` class with a method `old_method`:

```ruby
class OldSystem
  def old_method
    puts "This is the old method"
  end
end
```

Now, you want to create a new `NewSystem` class with a different method name, `new_method`, but you also want to use the functionality of `OldSystem`. You can create an adapter class to achieve this:

```ruby
# Adapter class to make OldSystem compatible with NewSystem
class OldSystemAdapter
  def initialize(old_system)
    @old_system = old_system
  end

  def new_method
    @old_system.old_method
  end
end
```

Now, you can use the `OldSystemAdapter` to make the `OldSystem` work with the `NewSystem` interface:

```ruby
class NewSystem
  def initialize(adapter)
    @adapter = adapter
  end

  def use_new_method
    @adapter.new_method
  end
end
```

Here's how you can use these classes:

```ruby
old_system = OldSystem.new
adapter = OldSystemAdapter.new(old_system)
new_system = NewSystem.new(adapter)

new_system.use_new_method # This is the old method
```

In this example, the `OldSystemAdapter` acts as an adapter that bridges the gap between `OldSystem` and `NewSystem`. This allows you to use `OldSystem`'s functionality through the `NewSystem` interface without modifying the existing code of `OldSystem`.