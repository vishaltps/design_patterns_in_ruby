The Command pattern is a behavioral design pattern that encapsulates a request as an object, thereby allowing you to parameterize clients with queues, requests, and operations. It also allows you to support undoable operations.

In Ruby, you can implement the Command pattern using classes to represent commands and receivers (objects that perform the actual work). Here's a simple example:

```ruby
# Receiver class that performs the actual operations
class Light
  def turn_on
    puts "Light is on"
  end

  def turn_off
    puts "Light is off"
  end
end

# Command interface with execute method
class Command
  def execute
    raise NotImplementedError, "#{self.class} has not implemented method 'execute'"
  end
end

# Concrete command for turning on the light
class TurnOnLightCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.turn_on
  end
end

# Concrete command for turning off the light
class TurnOffLightCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.turn_off
  end
end

# Invoker class that triggers the commands
class RemoteControl
  def initialize
    @commands = {}
  end

  def set_command(name, command)
    @commands[name] = command
  end

  def press_button(name)
    command = @commands[name]
    command.execute if command
  end
end

# Client code
light = Light.new
turn_on_command = TurnOnLightCommand.new(light)
turn_off_command = TurnOffLightCommand.new(light)

remote_control = RemoteControl.new
remote_control.set_command('on', turn_on_command)
remote_control.set_command('off', turn_off_command)

remote_control.press_button('on')  # Output: Light is on
remote_control.press_button('off') # Output: Light is off
```

In this example:

- `Light` is the receiver class that performs the actual operations (turning on and off).
- `Command` is the command interface with an `execute` method.
- `TurnOnLightCommand` and `TurnOffLightCommand` are concrete command classes that encapsulate the actions to be performed.
- `RemoteControl` is the invoker class that holds and triggers the commands.
- In the client code, we create a `Light` instance, command objects, and a remote control. We associate commands with specific actions using the `set_command` method, and then we press buttons on the remote control to trigger the associated commands.

The Command pattern decouples the sender (invoker) from the receiver (performer) and allows you to encapsulate commands in objects, making it easy to extend and maintain the code.