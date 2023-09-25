class SlickButton

  # Lots of button drawing and management
  # code omitted...

  def on_button_push
    # Do something when the button is pushed
  end
end



class SaveButton < SlickButton
  def on_button_push
    # Save the current document...
  end
end


class SaveCommand
  def execute
    # Save the current document...
  end
end


class SlickButton
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def on_button_push
    @command.execute if @command
  end
end
