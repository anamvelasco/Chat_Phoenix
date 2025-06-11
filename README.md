# Chat in Phoenix

This is a simplified real-time chat application using Phoenix Channels. It allows multiple clients to connect to a WebSocket channel and broadcast messages to all users.

## Features
- Join a chat room
- Send messages in real time
- Receive broadcast messages instantly

## Technologies Used
- Elixir
- Phoenix Framework
- Phoenix Channels
- WebSockets
- JavaScript frontend (Phoenix default assets)

## Setup Instructions

### 1. Create Phoenix Project
```
mix phx.new chat_phoenix --no-ecto
cd chat_phoenix
```

### 2. Install Dependencies
```
mix deps.get
cd assets && npm install && cd ..
```

### 3. Generate the Channel
```
mix phx.gen.channel Room
```

### 4. Add Channel Logic
Edit `lib/chat_phoenix_web/channels/room_channel.ex`.

### 5. Update Endpoint & UserSocket
In `lib/chat_phoenix_web/endpoint.ex`, enable the socket.
In `lib/chat_phoenix_web/channels/user_socket.ex`, add:
```
channel "room:*", ChatPhoenixWeb.RoomChannel
```

### 6. Frontend Connection Example
Use `assets/js/socket.js` for connecting and sending messages.

### 7. Run the App
```
mix phx.server
```
Visit [`localhost:4000`](http://localhost:4000)

---

## Testing

Create the test file `test/chat_phoenix_web/channels/room_channel_test.exs`.

### Run tests
```
mix test
```

## License
MIT
