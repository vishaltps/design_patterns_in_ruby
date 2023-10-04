# Problem

We need to create objects without having to specify the exact class of the object that will be created.

# Solution

The Factory pattern is a specialization of the Template pattern. We start by creating a generic base class where we don't make the "which class" decision. Instead, whenever it needs to create a new object, it calls a method that is defined in a subclass. So, depending on the subclass we use (factory), we create objects of one class or another (products).

