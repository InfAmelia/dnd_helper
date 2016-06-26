module PartyHelper

  def draw_table
    if @Party.members.count < 4
      @Party.members.map do |member, index|
        seat = draw_seat(index)
        "<div class='#{seat}'>#{member}</div>"
      end
    elsif @Party.members.count < 8
      "different formatting"
    else
      "Too many players."
    end
  end

  def draw_seat(index)
    # depending on the seat number, place the player in the party in a different place.
    calculate_width(index) + calculate_push(index)
  end

  def calculate_width(index)
    "col l4"
  end

  def calculate_push(index)
    " push-l#{index}"
  end

  def calculate_pull(index)
    " pull-l#{index}"
  end
end
