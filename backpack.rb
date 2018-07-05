class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare
    # set up local variables used by rest of prepare method
    weather = @attributes[:weather]
    day_of_week = @attributes[:day_of_week]
    regular_attire
    # Pack attire based on weather
    if weather == 'rainy'
      @items << 'umbrella'
    elsif weather == 'cold'
      @items << 'jacket'
    end
    #pack gym shoes based on day
    pack_gym_shoes_if_monday_or_thursday(day_of_week)
    #pack lunch based on day
    pack_lunch_if_weekday(day_of_week)
  end


    #manadatory attire for all days
  def regular_attire
    @items << 'pants'
    @items << 'shirt'
  end


  def pack_gym_shoes_if_monday_or_thursday(day_of_week)
    if day_of_week == 'monday' || day_of_week == 'thursday'
      #add gym shoes to items
      @items << 'gym shoes'
    end
  end

  def pack_lunch_if_weekday(day_of_week)
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      @items << 'packed lunch'
    else # Used to bring snacks on weekend trips, but now I just buy 'em
      @items << 'snacks'
    end
  end



  # Prints a summary packing list for Melinda's backpack
  def list
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end

end
