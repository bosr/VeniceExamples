import Venice

func ex05() {
	pd(5, "Channel Directions")

	// When using channels as function parameters, you can specify if a channel is meant to only send or receive values. This specificity increases the type-safety of the program.

	// This ping function only accepts a channel that receives values. It would be a compile-time error to try to receive values from this channel.

	func ping(pings: SendingChannel<String>, message: String) {
		pings.send(message)
	}

	// The pong function accepts one channel that only sends values (pings) and a second that only receives values (pongs).

	func pong(pings: ReceivingChannel<String>, pongs: SendingChannel<String>) {
		let message = pings.receive()!
		pongs.send(message)
	}

	let pings = Channel<String>(bufferSize: 1)
	let pongs = Channel<String>(bufferSize: 1)

	ping(pings: pings.sendingChannel, message: "passed message")
	pong(pings: pings.receivingChannel, pongs: pongs.sendingChannel)

	print(pongs.receive()!)
}
