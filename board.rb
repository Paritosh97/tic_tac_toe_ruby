class Board

  def initialize
    @a = Array.new(9,'_')
  end

  def print_board
    9.times do |i|
        if i%3==2
          print @a[i]+"\n"
        else
          print @a[i]+" "
        end
    end
  end

  def put_move(pos, sign)
    @a[pos] = sign
  end

  def available_moves
    s = ''
    @a.each_with_index do |i, x|
      if i == '_'
        s += ' ' + x.to_s
      end
    end
    return s
  end

  def win(sign)

    (0...8).step(3) do |x|
      match = 0
      x.upto(x+2) do |i|
        if @a[i] == sign
          match += 1
        end
      end
      if match == 3
        return true
      end
    end


    0.upto(2) do |x|
      match = 0
      (x...(x+7)).step(3) do |i|
        if @a[i] == sign
          match += 1
        end
      end
      if match == 3
        return true
      end
    end

    match = 0
    (0...9).step(4) do |x|
      if @a[x] == sign
        match += 1
      end
    end
    if match == 3
      return true
    end

    match = 0
    (2...7).step(2) do |x|
      if @a[x] == sign
        match += 1
      end
    end
    if match == 3
      return true
    end

      false

  end

  def draw
    if available_moves == ''
      return true
    else
      return false
    end
  end
end
