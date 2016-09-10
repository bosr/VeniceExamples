import Venice

func ex08() {
	pd(8, "Non-Blocking Channel Operations")

	let messages = Channel<String>()
	let signals = Channel<Bool>()

	select { when in
		when.receive(from: messages) { message in
			print("received message \(message)")
		}
		when.otherwise {
			print("no message received")
		}
	}

	// a non-blocking send works similarly
	let message = "hi"

	select { when in
		when.send(message, to: messages) {
			print("sent message \(message)")
		}
		when.otherwise {
			print("no message sent")
		}
	}

	select { when in
		when.receive(from: messages) { message in
			print("received message \(message)")
		}
		when.receive(from: signals) { signal in
			print("received signal \(signal)")
		}
		when.otherwise {
			print("no activity")
		}
	}
}
