# The Composite pattern is a structural design pattern that lets you compose objects into tree structures to represent part-whole hierarchies. It allows clients to treat individual objects and compositions of objects uniformly. In Ruby, you can implement the Composite pattern using classes to represent both leaf objects (individual objects) and composite objects (objects composed of other objects). Here's a simple example:

# Component class (the base class for leaf and composite objects)
class Component
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def display(indent = 0)
    puts ' ' * indent + @name
  end
end

# Leaf class (represents individual objects)
class Leaf < Component
end

# Composite class (represents objects composed of other objects)
class Composite < Component
  def initialize(name)
    super(name)
    @children = []
  end

  def add(child)
    @children << child
  end

  def remove(child)
    @children.delete(child)
  end

  def display(indent = 0)
    super(indent)
    @children.each { |child| child.display(indent + 2) }
  end
end

# Client code
root = Composite.new('Root')

subtree1 = Composite.new('Subtree 1')
subtree1.add(Leaf.new('Leaf A'))
subtree1.add(Leaf.new('Leaf B'))

subtree2 = Composite.new('Subtree 2')
subtree2.add(Leaf.new('Leaf X'))
subtree2.add(Leaf.new('Leaf Y'))

root.add(subtree1)
root.add(subtree2)
root.add(Leaf.new('Leaf Z'))

root.display


# In this example:

# - `Component` is the base class that both `Leaf` and `Composite` classes inherit from. It defines common attributes and methods.
# - `Leaf` represents individual objects that don't have children.
# - `Composite` represents objects composed of other objects. It has a collection of child components and methods for adding and removing children.
# - In the client code, we create a tree structure with a root composite, two subtrees (each composed of leaf and composite objects), and individual leaf objects. We then call `display` on the root to display the entire tree.

# The Composite pattern allows you to treat individual objects and compositions of objects uniformly, making it useful for creating complex hierarchies of objects.