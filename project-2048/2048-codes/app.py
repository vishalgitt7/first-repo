
import random
import os

class Game2048:
    def __init__(self):
        self.grid_size = 4
        self.grid = [[0] * self.grid_size for _ in range(self.grid_size)]
        self.add_new_tile()
        self.add_new_tile()

    def add_new_tile(self):
        empty_cells = [(i, j) for i in range(self.grid_size) for j in range(self.grid_size) if self.grid[i][j] == 0]
        if empty_cells:
            i, j = random.choice(empty_cells)
            self.grid[i][j] = 4 if random.random() > 0.9 else 2

    def compress(self):
        new_grid = [[0] * self.grid_size for _ in range(self.grid_size)]
        for i in range(self.grid_size):
            pos = 0
            for j in range(self.grid_size):
                if self.grid[i][j] != 0:
                    new_grid[i][pos] = self.grid[i][j]
                    pos += 1
        self.grid = new_grid

    def merge(self):
        for i in range(self.grid_size):
            for j in range(self.grid_size - 1):
                if self.grid[i][j] == self.grid[i][j + 1] and self.grid[i][j] != 0:
                    self.grid[i][j] *= 2
                    self.grid[i][j + 1] = 0

    def reverse(self):
        for i in range(self.grid_size):
            self.grid[i] = self.grid[i][::-1]

    def transpose(self):
        self.grid = [list(row) for row in zip(*self.grid)]

    def move_left(self):
        self.compress()
        self.merge()
        self.compress()

    def move_right(self):
        self.reverse()
        self.move_left()
        self.reverse()

    def move_up(self):
        self.transpose()
        self.move_left()
        self.transpose()

    def move_down(self):
        self.transpose()
        self.move_right()
        self.transpose()

    def is_game_over(self):
        for i in range(self.grid_size):
            for j in range(self.grid_size):
                if self.grid[i][j] == 0:
                    return False
                if j < self.grid_size - 1 and self.grid[i][j] == self.grid[i][j + 1]:
                    return False
                if i < self.grid_size - 1 and self.grid[i][j] == self.grid[i + 1][j]:
                    return False
        return True

    def display(self):
        os.system('clear')
        for row in self.grid:
            print('\t'.join(str(num) if num != 0 else '.' for num in row))
        print()

    def play(self):
        while not self.is_game_over():
            self.display()
            move = input("Enter move (WASD): ").lower()
            if move == 'w':
                self.move_up()
            elif move == 'a':
                self.move_left()
            elif move == 's':
                self.move_down()
            elif move == 'd':
                self.move_right()
            else:
                continue
            self.add_new_tile()
        print("Game Over!")

if __name__ == "__main__":
    game = Game2048()
    game.play()

