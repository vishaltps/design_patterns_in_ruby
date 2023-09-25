# Problem

We want to perform some specific task without knowing how the whole process works or having any information about the receiver of the request.

# Solution

The Command pattern decouples the object that needs to perform a specific task from the one that knows how to do it. It encapsulates all the needed information to do the job into its own object including: who the receiver(s) is(are), the methods to invoke, and the parameters. That way, any object that wants to perform the task only needs to know about the command object interface.



# Situations where it can be helpful

- The Command pattern is pretty useful if we need to implement undo feature. All we need to do is implement the unexecute method in our command object. For example, this is how we would implement creating a file:

- Another situation where the command pattern is really handy is in installation programs. Combining it with the composite pattern, we can store a list of tasks to be performed:



