class Computer
  attr_accessor :display, :motherboard
  attr_reader :drives

  def initialize(display = :crt, motherboard= Motherboard.new, drives = [])
    @motherboard = motherboard
    @drives = drives
    @display = display
  end
end

class CPU

end
class BasicCPU < CPU
end
class SuperCPU < CPU
end

class Motherboard
  attr_accessor :cpu, :memory_size

  def initialize(cpu=BasicCPU.new, memory_size=1000)
    @cpu = cpu
    @memory_size = memory_size
  end
end



####### very tidious process to build the whole computer hence let's create a computer builder

class ComputerBuilder
  attr_reader :computer
  def initialize
    computer = Computer.new
  end

  def turbo(has_turbo_cpu=true)
    @computer.motherboard.cpu = TurboCPU.new
  end

  def display=(display)
    @computer.display=display
  end

  def memory_size=(size_in_mb)
    @computer.motherboard.memory_size = size_in_mb
  end

  def add_cd(writer=false)
    @computer.drives << Drive.new(:cd, 760, writer)
  end

  def add_dvd(writer=false)
    @computer.drives << Drive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size_in_mb)
    @computer.drives << Drive.new(:hard_disk, size_in_mb, true)
  end
end

builder = ComputerBuilder.new
builder.turbo
builder.add_cd(true)
builder.add_dvd
builder.add_hard_disk(100000)
