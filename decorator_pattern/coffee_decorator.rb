The decorator pattern in Ruby is a structural design pattern that allows you to add behavior to objects dynamically without altering their structure. It is used to extend the functionality of objects in a flexible and reusable way. The key idea behind the decorator pattern is to create a set of decorator classes that are used to wrap concrete components (objects) and provide additional functionality at runtime.

Here's how you can implement the decorator pattern in Ruby:

1. Define an interface or an abstract class (component) that represents the base object and declares the methods that will be used by both concrete components and decorators.

2. Create one or more concrete components that implement the interface. These are the base objects you want to extend.

3. Create decorator classes that also implement the interface and take a reference to a component as a parameter. Decorators add functionality to components by delegating calls to the component and possibly modifying the results.

4. Decorators can be stacked or chained together to create complex combinations of behavior.

Here's an example of the decorator pattern in Ruby:

```ruby
# Step 1: Define the component interface
class Coffee
  def cost
    5 # Base cost of coffee
  end
end

# Step 2: Create concrete components
class Espresso < Coffee
  def cost
    super + 2 # Espresso costs extra
  end
end

class Latte < Coffee
  def cost
    super + 3 # Latte costs extra
  end
end

# Step 3: Create decorator classes
class MilkDecorator < Coffee
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost + 1 # Milk costs extra
  end
end

class SugarDecorator < Coffee
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost + 0.5 # Sugar costs extra
  end
end

# Step 4: Create and use decorated objects
coffee = Coffee.new
puts "Cost of coffee: $#{coffee.cost}"

latte_with_milk = MilkDecorator.new(Latte.new)
puts "Cost of latte with milk: $#{latte_with_milk.cost}"

espresso_with_sugar_and_milk = MilkDecorator.new(SugarDecorator.new(Espresso.new))
puts "Cost of espresso with sugar and milk: $#{espresso_with_sugar_and_milk.cost}"
```

In this example, we have a base `Coffee` class and concrete components `Espresso` and `Latte`. We also have decorator classes `MilkDecorator` and `SugarDecorator` that add milk and sugar to the coffee, respectively.

The decorator pattern allows you to combine different behaviors dynamically, making it easy to create variations of objects while keeping the code open for extension and closed for modification.