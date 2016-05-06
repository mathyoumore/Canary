class Canary
  def self.puts(*phrase)
    $stdout.puts (color phrase)
  end

  def self.color(*word)
    song = "\e[33m"
    word[0].each do |arg|
      song << (arg.to_s.length <= 100 ? centered(arg) : tabbed(arg))
      song << "\n"
    end
    song << "\e[0m"
    song
  end
end

def centered arg
  phrase = ''
  phrase << "#{arg.class} is "
  phrase << "#{arg} "
  phrase.center(100, ' * ')
end

def tabbed arg
  phrase = ''
  phrase << "#{arg.class} is\n"
  phrase << "\t#{arg}"
  phrase
end

def standard_test
  msg = 'Hello, world!'
  sing msg
end

def hash_test
  msg =
    { first: 'The worst',
      second: 'The best',
      third: 'The one with the hairy chest'
    }
  sing msg
end

def class_test
  msg = Foo.new
  sing msg
end

def long_string_test
  msg = ''
  (0..100).each do |a|
    msg << a.to_s
  end
  sing msg
end

def long_format_test
  msg = ''
  (0..100).each do |a|
    msg << "#{a} \t"
  end
  sing msg
end

def large_hash_test
  msg = {}
  (0..100).each do |a|
    msg[a] = a.to_s
  end
  sing msg
end

def test_suite
  standard_test
  hash_test
  class_test
  long_string_test
  long_format_test
  large_hash_test
end

def sing(msg)
  Canary.puts msg
end

class Foo
  def initialize
    @message = "You got it!"
  end

  def to_s
    @message.to_s
  end

  def length
    @message.length
  end
end

test_suite
