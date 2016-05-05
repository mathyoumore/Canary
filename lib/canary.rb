class Canary
  def self.puts *phrase
    $stdout.puts (color phrase)
  end

  def self.color *word
    word[0].each do |arg|
    @phrase ||= ""
    @phrase << "#{arg.class} is "
    @phrase << "#{arg} "
    @phrase << "\n"
    end

    "\e[33m#{@phrase.center(50, ' * ')}\e[0m"
  end
end
