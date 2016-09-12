import Venice

func ex08() {
    print_header(8, "Non-Blocking Channel Operations")

    // Basic sends and receives on channels are blocking.  However, we can use `select` with a `otherwise` clause to implement _non-blocking_ sends, receives, and even non-blocking multi-way `select`s.

    let messages = Channel<String>()
    let signals = Channel<Bool>()

    // Here's a non-blocking receive. If a value is available on `messages` then `select` will take the `received(valueFrom: messages)` case with that value. If not it will immediately take the `otherwise` case.

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

    // We can use multiple cases above the `otherwise` clause to implement a multi-way non-blocking select. Here we attempt non-blocking receives on both `messages` and `signals`.
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
