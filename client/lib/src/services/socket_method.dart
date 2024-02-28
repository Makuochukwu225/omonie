import 'package:omonie/src/services/socket_client.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketMethod {
  final _socketClient = SocketClient.instance.socket!;

  Socket get socketClient => _socketClient;

  void check() {
    _socketClient.emit(
      "check",
      {'check': 'hello world'},
    );
  }

  void click(int count) {
    _socketClient.emit(
      "click",
      {'count': '$count'},
    );
  }

  listen(Function(dynamic) callback) {
    _socketClient.on('count', (data) {
      callback(data);
    });
  }

  //emit
  void createRoom(String nickname, bool isAI) {
    if (nickname.isNotEmpty) {
      _socketClient.emit(
        'createRoom',
        {'nickname': nickname, "isAI": isAI},
      );
    }
  }

  void joinRoom(String nickName, String roomId) {
    if (nickName.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit(
        'joinRoom',
        {'nickname': nickName, 'roomId': roomId},
      );
    }
  }

  void tapGrid(int index, List<String> displayElement, String roomId) {
    if (displayElement[index].isEmpty) {
      _socketClient.emit(
        'tap',
        {
          'index': index,
          'roomId': roomId,
          "board": displayElement,
        },
      );
    }
  }

  void aiTapGrid(List<String> displayElement, String roomId) {

      _socketClient.emit(
        'aitap',
        {
          'roomId': roomId,
          "board": displayElement,
        },
      );
    
  }

  //listeners
  void createRoomSuccessListener(Function(dynamic) callback) {
    _socketClient.on(
      'createRoomSuccess',
      (room) {
        callback(room);
      },
    );
  }

  void joinRoomSuccessListener(Function(dynamic) callback) {
    _socketClient.on(
      'joinRoomSuccess',
      (room) {
        callback(room);
      },
    );
  }

  void errorOccurredListener(Function(String) callback) {
    _socketClient.on(
      'errorOccurred',
      (errorMessage) {
        callback(errorMessage.toString());
      },
    );
  }

  void updatePlayerListener(Function(dynamic) callback) {
    _socketClient.on(
      'updatePlayers',
      (players) {
        callback(players);
      },
    );
  }

  void updateRoomListener(Function(dynamic) callback) {
    _socketClient.on(
      'updateRoom',
      (room) {
        callback(room);
      },
    );
  }

  void tapListeners(Function(dynamic) callback) {
    _socketClient.on('tapped', (data) {
      callback(data);
    });
  }

  void endGameListener(Function(dynamic) callback) {
    _socketClient.on('endGame', (data) {
      callback(data);
    });
  }

  void increasePointsPlayerListener(Function(dynamic) callback) {
    _socketClient.on('increasePointPlayer', (data) {
      callback(data);
    });
  }
}
