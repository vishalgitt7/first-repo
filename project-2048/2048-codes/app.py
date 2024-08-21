


from flask import Flask, render_template, jsonify, request
import random

app = Flask(__name__)

SIZE = 4

# Initialize the game board
def initialize_game():
    board = [[0] * SIZE for _ in range(SIZE)]
    add_new_tile(board)
    add_new_tile(board)
    return board

# Add a new tile (2 or 4) to the board
def add_new_tile(board):
    empty_tiles = [(i, j) for i in range(SIZE) for j in range(SIZE) if board[i][j] == 0]
    if empty_tiles:
        i, j = random.choice(empty_tiles)
        board[i][j] = random.choice([2, 4])

# Shift all numbers in the row left
def compress(row):
    new_row = [num for num in row if num != 0]
    new_row += [0] * (SIZE - len(new_row))
    return new_row

# Merge tiles for the left move
def merge(row):
    for i in range(SIZE - 1):
        if row[i] == row[i + 1] and row[i] != 0:
            row[i] *= 2
            row[i + 1] = 0
    return row

# Execute a move left
def move_left(board):
    new_board = []
    for row in board:
        compressed_row = compress(row)
        merged_row = merge(compressed_row)
        final_row = compress(merged_row)
        new_board.append(final_row)
    return new_board

# Rotate the board to help with directional moves
def rotate_board(board):
    return [list(row) for row in zip(*board[::-1])]

# Handle moves in different directions
def move(board, direction):
    for _ in range(direction):
        board = rotate_board(board)
    board = move_left(board)
    for _ in range(4 - direction):
        board = rotate_board(board)
    return board

# Check if any moves are possible
def is_game_over(board):
    if any(0 in row for row in board):
        return False
    for i in range(SIZE):
        for j in range(SIZE - 1):
            if board[i][j] == board[i][j + 1] or board[j][i] == board[j + 1][i]:
                return False
    return True

# Flask routes
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/start', methods=['GET'])
def start_game():
    board = initialize_game()
    return jsonify({'board': board})

@app.route('/move', methods=['POST'])
def make_move():
    board = request.json.get('board')
    direction = request.json.get('direction')  # 0: left, 1: up, 2: right, 3: down
    board = move(board, direction)
    if any(0 in row for row in board):
        add_new_tile(board)
    game_over = is_game_over(board)
    return jsonify({'board': board, 'game_over': game_over})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
