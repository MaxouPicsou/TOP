
def banner
  puts "   ___________ __               ___________                     ___________   "  
  puts "   \\__    ___/|__| ____         \\__    ___/____    ____         \\__    ___/___   ____  "
  puts "     |    |   |  |/ ___\\   ______ |    |  \\__  \\ _/ ___\\   ______ |    | /  _ \\_/ __ \\ "
  puts "     |    |   |  \\  \\___  /_____/ |    |   / __ \\\\  \\___  /_____/ |    |(  <_> )  ___/ "
  puts "     |____|   |__|\\___  >         |____|  (____  /\\___  >         |____| \\____/ \\___  >"
  puts "                      \\/                       \\/     \\/                            \\/ "
  puts ""
  puts "Welcome to the Tic-Tac-Toe ruby's game! Each of the players will chose they player's name and "
  puts "the symbol with which they want to play and let's go to the game!"
  puts ""
end

class Player
    attr_reader :name
    def initialize(grid, name, symbol)
        @grid = grid
        @name = name
        @symbol = symbol
    end

    public
    def play(row, column)
        case row.upcase
        when "A"
            if @grid.line_A[column - 1] == " "
                @grid.line_A[column - 1] = @symbol
                return true
            else
                puts "There is already something here!"
                return false
            end
        when "B"
            if @grid.line_B[column - 1] == " "
                @grid.line_B[column - 1] = @symbol
                return true
            else
                puts "There is already something here!"
                return false
            end
        when "C"
            if @grid.line_C[column - 1] == " "
                @grid.line_C[column - 1] = @symbol
                return true
            else
                puts "There is already something here!"
                return false
            end
        else
            puts "Error, bad row input"
            return false
        end
    end

    def win
        if @grid.line_A.count(@symbol) == 3 or @grid.line_B.count(@symbol) == 3 or @grid.line_C.count(@symbol) == 3
            return true
        elsif (@grid.line_A[0] == @symbol and @grid.line_B[0] == @symbol and @grid.line_C[0] == @symbol) or 
              (@grid.line_A[1] == @symbol and @grid.line_B[1] == @symbol and @grid.line_C[1] == @symbol) or
              (@grid.line_A[2] == @symbol and @grid.line_B[2] == @symbol and @grid.line_C[2] == @symbol)
            return true
        elsif (@grid.line_A[0] == @symbol and @grid.line_B[1] == @symbol and @grid.line_C[2] == @symbol) or 
              (@grid.line_A[2] == @symbol and @grid.line_B[1] == @symbol and @grid.line_C[0] == @symbol)
            return true
        else
            return false
        end
    end
end

class Grid
    attr_accessor :line_A, :line_B, :line_C
    def initialize
        @line_A = [" ", " ", " "]
        @line_B = [" ", " ", " "]
        @line_C = [" ", " ", " "]
    end

    public
    def display
        puts "  1   2   3"
        puts "A #{@line_A[0]} | #{@line_A[1]} | #{@line_A[2]} "
        puts " -----------"
        puts "B #{@line_B[0]} | #{@line_B[1]} | #{@line_B[2]} "
        puts " -----------"
        puts "C #{@line_C[0]} | #{@line_C[1]} | #{@line_C[2]} "
    end
end

banner
grid = Grid.new

puts "Enter the name of player1 who's gonna play 'X' symbol..."
name = gets.chomp
player1 = Player.new(grid, name, 'X')
puts ""
puts "Enter the name of player2 who's gonna play 'O' symbol..."
name = gets.chomp
player2 = Player.new(grid, name, 'O')

puts ""
grid.display

while player1.win == false and player2.win == false
    puts ""
    puts "It's the turn of #{player1.name}, enter the coordonates without space..."
    input = gets.chomp
    status = player1.play(input[0], input[1].to_i)
    while status == false
        puts "Try again!"
        input = gets.chomp
        status = player1.play(input[0], input[1].to_i)
    end
    grid.display
    break if player1.win 
    puts ""
    puts "It's the turn of #{player2.name}, enter the coordonates without space..."
    input = gets.chomp
    player2.play(input[0], input[1].to_i)
    while status == false
        puts "Try again!"
        input = gets.chomp
        status = player2.play(input[0], input[1].to_i)
    end
    grid.display
    break if player2.win 
end

puts ""

if player1.win
    puts "#{player1.name} a gagné la partie!"
else
    puts "#{player2.name} a gagné la partie!"
end

