// aiModel.js

class AIPlayer {
  constructor(playerType, difficulty) {
    this.socketID = `ai_${Date.now()}`;
    this.nickName = `AI-${difficulty}`;
    this.playerType = playerType;
    this.difficulty = difficulty;
  }

  makeMove(board) {
    return this.getRandomMove(board);
  }

  getRandomMove(board) {
    const emptyCells = this.getEmptyCells(board);
    const randomIndex = Math.floor(Math.random() * emptyCells.length);
    return emptyCells[randomIndex];
  }

  
  getEmptyCells(board) {
    const emptyCells = [];
    for (let i = 0; i < board.length; i++) {
      for (let j = 0; j < board[i].length; j++) {
        if (board[i][j] === null) {
          emptyCells.push({ row: i, col: j });
        }
      }
    }
    return emptyCells;
  }


}

module.exports = AIPlayer;
