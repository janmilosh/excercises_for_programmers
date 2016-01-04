ENGLISH_TO_METRIC = 0.09290304

class RectangleArea
  attr_accessor :length, :width

  def prompt text
    print text
    gets.chomp
  end

  def get_valid_length
    @length = (prompt "\nWhat is the length of the room in feet? ").to_i
    if @length <= 0
      puts 'Please input a positive integer value.'
      get_valid_length
    end
  end

  def get_valid_width
    @width = (prompt "What is the width of the room in feet? ").to_i
    if @width <= 0
      puts 'Please input a positive integer value.'
      get_valid_width
    end
  end

  def calculate_english
    @length * @width
  end

  def calculate_metric
    (@length * @width * ENGLISH_TO_METRIC).round(3)
  end

  def output
    puts "You entered dimensions of #{ @length } feet by #{ @width } feet."
    puts "The area is\n#{ calculate_english } square feet\n#{ calculate_metric } square meters\n\n"
  end

  def run
    get_valid_length
    get_valid_width
    output
  end
end

if __FILE__ == $0
  area = RectangleArea.new
  area.run
end
