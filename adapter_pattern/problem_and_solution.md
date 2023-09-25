Problem
We want an object talk to some other object but their interfaces don't match.

Solution
We simply wrap the adaptee with our new adapter class. This class implements an interface that the invoker understands, although all the work is performed by the adapted object.

