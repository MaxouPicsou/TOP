require "rainbow/refinement"
using Rainbow

def banner
    key_banner_color = :turquoise
    puts "     _____                   __                       .__            .___".color(key_banner_color)
    puts "    /     \\ _____    _______/  |_  ___________  _____ |__| ____    __| _/".color(key_banner_color)
    puts "   /  \\ /  \\\\__  \\  /  ___/\\   __\\/ __ \\_  __ \\/     \\|  |/    \\  / __ | ".color(key_banner_color)
    puts "  /    Y    \\/ __ \\_\\___ \\  |  | \\  ___/|  | \\/  Y Y  \\  |   |  \\/ /_/ | ".color(key_banner_color)
    puts "  \\____|__  (____  /____  > |__|  \\___  >__|  |__|_|  /__|___|  /\\____ | ".color(key_banner_color)
    puts "          \\/     \\/     \\/            \\/            \\/        \\/      \\/".color(key_banner_color)
    puts ""
    puts "Let's go play to mastermind, will you beat the computer?"
    puts "A green circle (#{"o".green}) indicates the existence of a correct color on the right place."
    puts "A red circle (#{"o".red}) indicates the existence of a correct color but on a wrong place."
    puts "Good luck!"
end

class Computer
    attr_reader :code, :code_count
    $colors = {'Y' => 'Y'.yellow, 
                'B' => 'B'.blue, 
                'G' => 'G'.green, 
                'R' => 'R'.red, 
                'O' => 'O'.color(:orange), 
                'M' => 'M'.color(:purple)}
    $items = $colors.values
    def initialize
        @code = [$items[rand($items.length)], $items[rand($items.length)], $items[rand($items.length)], $items[rand($items.length)]]
        @code_count = {'Y' => @code.count('Y'.yellow),
                       'B' => @code.count('B'.blue),
                       'G' => @code.count('G'.green),
                       'R' => @code.count('R'.red),
                       'O' => @code.count('O'.color(:orange)),
                       'M' => @code.count('M'.color(:purple)),}
    end
end

class Player
    attr_reader :name, :turn
    def initialize(name, mastermind, computer)
        @name = name
        @mastermind = mastermind
        @computer = computer
        @turn = 0
        @counter_result = [0, 0]
    end

    def play(string)
        @counter_result = [0, 0]
        @code_count = @computer.code_count.dup
        for i in (0..3)
            @mastermind.grid[@turn][i] = $colors[string[i]]
            if @computer.code[i] == @mastermind.grid[@turn][i]
                @counter_result[0] += 1
                @code_count[string[i]] -= 1
            end
        end
        for i in (0..3)
            if @code_count[string[i]] > 0
                @counter_result[1] += 1
                @code_count[string[i]] -= 1
            end
        end
        @mastermind.grid[@turn][4] = "o".color(:green) * @counter_result[0] + "o".red * @counter_result[1]
        @turn += 1
    end

    def win
        if @mastermind.grid[@turn - 1][4] == "o".color(:green) * 4
            return true
        else
            return false
        end
    end

    def lose
        if @turn == 12 and @mastermind.grid[@turn - 1][4] != "o".color(:green) * 4
            return true
        else
            return false
        end
    end
end

class Mastermind
    attr_accessor :grid
    def initialize
        @grid = Array.new(12) {Array.new(5, "_")}
    end

    public
    def display
        for x in (0..11)
            puts "#{@grid[x][0]} #{@grid[x][1]} #{@grid[x][2]} #{@grid[x][3]} | #{@grid[x][4]}"
        end
        puts ""
    end
end

computer = Computer.new
mastermind = Mastermind.new
player = Player.new("Maxou", mastermind, computer)

puts banner
puts mastermind.display

while true
    puts "Enter your combinaison without space..."
    combinaison = gets.chomp
    player.play(combinaison)
    mastermind.display
    break if player.win or player.lose
end

if player.win
    print "#{player.name} you win in #{player.turn} "
    puts player.turn > 1 ? "turns" : "turn"
else
    puts "#{player.name} you lose and the solution was #{computer.code[0]} #{computer.code[1]} #{computer.code[2]} #{computer.code[3]}" 
end





