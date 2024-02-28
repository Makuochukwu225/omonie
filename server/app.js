require('dotenv').config();
const express = require('express');
const http = require('http');
const colors = require("colors")
const socketIO = require('socket.io');
const AIPlayer = require('./models/aiPlayer');

const app = express();
const port = process.env.PORT || 3000;
const server = http.createServer(app);
const io = socketIO(server);

// Connect to the database
const connectDb = require('./helpers/db');


app.use(express.urlencoded({ extended: false }));
// Middleware
app.use(express.json());


app.get('/', (req, res) => {
  res.status(200).json({
    msg: "Server up and running!"
  });
});

app.use("/api/v1/user", require("./routes/user.route"));
app.use("/api/v1/avatar", require("./routes/avatar.route"));
app.use("/api/v1/asset", require("./routes/asset.route"));
app.use("/api/v1/post", require("./routes/post.route"));
app.use("/api/v1/paystack", require("./routes/paystack.route"));
app.use("/api/v1/investment", require("./routes/investment.route"));
app.use("/api/v1/nut", require("./routes/nut.route"));
// app.use('/api', postRouter); 

const Room = require('./models/room')
const aiPlayer = new AIPlayer('x', 'medium');

io.on('connection', (socket) => {
  console.log('New client connected');



  //create a room
  socket.on('createRoom', async ({ nickname, isAI }) => {
    console.log(nickname);
    console.log(isAI);
    try {
      let room = new Room();
      let player;
      if (isAI) {
        const aiDifficulty = 'medium'; // Adjust as needed
        player = aiPlayer;

      } else {
        player = {
          socketID: socket.id,
          nickName: nickname,
          playerType: 'x'
        };
      }


      room.players.push(player);
      // room.turn = player;
      room = await room.save();
      const roomId = room._id.toString();

      console.log(room);

      socket.join(roomId);

      io.to(roomId).emit('createRoomSuccess', room);

    } catch (ex) {
      Console.log(ex);
    }

  });


  //join room
  socket.on('joinRoom', async ({ nickname, roomId }) => {
    console.log(`nickname : ${nickname} , roomId : ${roomId}`);
    try {
      if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
        socket.emit('errorOccurred', 'Please enter a valid room ID.')
        return;
      }
      let room = await Room.findById(roomId);
      if (room.isJoin) {
        let player = {
          socketID: socket.id,
          nickName: nickname,
          playerType: 'o'
        };
        room.players.unshift(player);
        room.turn = player;
        room.isJoin = false;
        room = await room.save();

        socket.join(roomId);

        console.log(room);

        io.to(roomId).emit('joinRoomSuccess', room);
        io.to(roomId).emit('updatePlayers', room.players);
        io.to(roomId).emit('updateRoom', room);

      } else {
        socket.emit('errorOccurred', 'The game is in progress, try again later.')
      }
    } catch (ex) {
      console.log(ex);
    }
  });


  //tap grid
  socket.on('tap', async ({ index, roomId, board }) => {
    try {
      let room = await Room.findById(roomId);
      let choice = room.turn.playerType;

      if (room.turnIndex == 0) {
        room.turnIndex = 1;
        room.turn = room.players[1];
      } else {
        room.turnIndex = 0;
        room.turn = room.players[0];
      }
      room = await room.save();


      io.to(roomId).emit('tapped', { index, room, choice });


    } catch (ex) {
      console.log(ex);
    }

  });


  socket.on('aitap', async ({ roomId, board }) => {
      var index = aiPlayer.makeMove(board);
    let room = await Room.findById(roomId);
    if (room.turnIndex == 0) {
      room.turnIndex = 1;
      room.turn = room.players[1];
    } else {
      room.turnIndex = 0;
      room.turn = room.players[0];
    }
    room = await room.save();
    console.log(roomId);
    
      console.log(index);
      console.log(board);
    io.to(roomId).emit('tapped', { index, room, choice:"x" });
  });
  //winner round
  socket.on('winner', async ({ roomId, socketID }) => {
    try {
      let room = await Room.findById(roomId);
      let player = room.players.find((p) => p.socketID == socketID);
      player.points += 1;
      room.round += 1;
      room = await room.save();

      if (room.maxRound <= player.points) {
        io.to(roomId).emit('endGame', player);
      } else {
        io.to(roomId).emit('increasePointPlayer', player);
      }
    } catch (ex) {
      console.log(ex);
    }
  });




























});

const start = async () => {
  try {
    await connectDb(); // Continuously send data to clients every second
    server.listen(port, () =>
      console.log(`Server is listening on port ${port}...`)
    );
  } catch (error) {
    console.log(error);
  }
};

start();
