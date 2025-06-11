import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {userToken: "123"}})

socket.connect()

let channel = socket.channel("room:lobby", {})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

channel.push("message", {body: "Hello from client"})

channel.on("message", payload => {
  console.log("New message:", payload.body)
})
