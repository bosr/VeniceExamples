import Venice

func ex09() {
	pd(9, "Closing Channels")

	let jobs = Channel<Int>(bufferSize: 5)
	let done = Channel<Void>()

	co {
		while true {
			if let job = jobs.receive() {
				print("received job \(job)")
			} else {
				print("received all jobs")
				done.send()
				return
			}
		}
	}

	// This sends 3 jobs to the worker over the jobs channel, then closes it.
	for job in 1...3 {
		print("sent job \(job)")
		jobs.send(job)
	}

	jobs.close()
	print("sent all jobs")

	// We await the worker using the synchronization approach we saw earlier.
	done.receive()
}
