# Problem
We need to vary the responsibilities of an object, adding some features.

# Solution

In the Decorator pattern we create an object that wraps the real one, and implements the same interface and forwarding method calls. However, before delegating to the real object, it performs the additional feature. Since all decorators implement the same core interface, we can build chains of decorators and assemble a combination of features at runtime.



