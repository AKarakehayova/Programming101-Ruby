module GameOfLife
class Board
  include Enumerable

  def initialize (*cell_coordinates)
    @population = cell_coordinates
  end

  def each
    @population.each
  end

  def [] x y
    @population.include? [x, y]
  end

  def count
    @population.size
  end

  def neighbours
    NEIGHBOURS = [[0,1], [1,0], [-1, 0], [0, -1], [-1, -1], [1, 1], [-1, 1] [1, -1]]
  end

  def underpopulation(cell_x, cell_y)
    count = 0
    new_population = neighbours.map do |cell|
      cell[0] += cell_x
      cell[1] += cell_y
    end
    new_population.each do |x, y|
     count += 1 if @population [x, y]
    end

    if count < 2
      @population.delete([cell_x, cell_y])
    elsif count > 3
      @population.delete([cell_x, cell_y])
    elsif @population [cell_x, cell_y] == false and count == 3
      @population.push([cell_x, cell_y])
    end
    @population
  end






  def next_generation
    Board.new(@population | underpopulation )
  end
end
end




