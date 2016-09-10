import Venice

func ex02() {
	pd(2, "Channels")

	// Channels are the pipes that connect concurrent coroutines. You can send values into channels from one coroutine and receive those values into another coroutine.

	// Create a new channel with Channel<Type>(). Channels are typed by the values they convey.

	let messages = Channel<String>()

	// Send a value into a channel using the channel.send(value) syntax. Here we send "ping" to the messages channel we made above, from a new coroutine.

	co(messages.send("ping"))

	// The channel.receive() syntax receives a value from the channel. Here we'll receive the "ping" message we sent above and print it out.

	let message = messages.receive()
	print(message!)

	// When we run the program the "ping" message is successfully passed from one coroutine to another via our channel. By default sends and receives block until both the sender and receiver are ready. This property allowed us to wait at the end of our program for the "ping" message without having to use any other synchronization.

	// Values received from channels are Optionals. If you try to get a value from a closed channel with no values left in the buffer, it'll return nil. If you are sure that there is a value wraped in the Optional, you can use the ! operator, to force unwrap the optional.
}
