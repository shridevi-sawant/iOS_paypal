
var handlers: [ () -> Void ] = []

// higher order func
// escaping closure - closure not executed within function
func addHandler(handler: @escaping () -> Void ) {

    handlers.append(handler)
}


addHandler {
    print("Task 1")
}

addHandler {
    print("Task 2")
}


for operation in handlers {
    operation()
}
