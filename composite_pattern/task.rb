# In the Composite pattern, we'll model every step in a separate class with a common interface that will report back how long they take. So we'll define a common base class, Task, that plays the role of component.

class Task
  attr_accessor :name, :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def get_time_required
    0.0
  end
end

# We can now create the classes in charge of the most basic jobs (leaf classes) like AddDryIngredientsTask:

class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0
  end
end

# What we need now is a container to deal with complex tasks that are internally built up of any number of subtasks, but look like any other Task from the outside. We'll create the composite class:

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    @sub_tasks.inject(0.0) {|time, task| time += task.get_time_required}
  end
end

# With this base class we can build complex tasks that behave like a simple one (because it implements the Task interface), and also add subtasks with the method add_sub_task. We'll create the MakeBatterTask

class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    add_sub_task(AddDryIngredientsTask.new)
    add_sub_task(AddLiquidsTask.new)
    add_sub_task(MixTask.new)
  end
end

# We must keep in mind that the objects tree may go as deep as we want. MakeBatterTask contains only leaf objects, but we could create a class that contains composite objects and it would behave exactly the same:


class MakeCakeTask < CompositeTask
  def initialize
    super('Make cake')
    add_sub_task(MakeBatterTask.new)
    add_sub_task(FillPanTask.new)
    add_sub_task(BakeTask.new)
    add_sub_task(FrostTask.new)
    add_sub_task(LickSpoonTask.new)
  end
end