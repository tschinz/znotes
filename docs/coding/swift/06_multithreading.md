---
tags:
- coding
- swift
---
# Multithreading

## Queue

Multithreading is mostly about "queues" in iOS. Function (usually closures) are lined up in a queue. The those functions are pulled off the queue and executed on an associated thread.

### Main queue (serial queue)

All UI activity **MUST** occur **only** on this queue. Also all NON-UI activity that is all time consuming must **NOT** occur on that queue. We want the UI to be responsive! Functions are pulled off and worked on in the main queue only when it's quiet. All normal code will be happen in the main queue.

``` swift
let mainQ: dispatch_queue_t = dispatch_get_main_queue()
let mainQ: NSOperationQueue = NSOperationQueue.mainQueue() // for Object oriented API

dispatch_async(not the mainQueue){
  // do something that might blok or tkaes a while
  dispatch_async(dispatch_get_main_queue()) {
    // call UI Functions with the result of the above
  }
}
```

### Other queues

iOS are creating those queue as needed.

#### Execute a function on another queue

``` swift
let queue dispatch_queue_t = <get the queue you want....>
dispatch_async(queue) {/* fo what you want to do here */}
```

#### Quality of Service

Most non-main-queue work will happen on a concurrent queue with a certain quality of service.

``` swift
QOS_CLASS_USER_INTERACTIVE // quick and high priority
QOS_CLASS_USER_INITIATED   // high priority, might take time
QOS_CLASS_UTILITY          // long running
QOS_CLASS_BACKGROUND       // user not concerned with this (prefetching etc.)
let qos = INT(<one of the above>.value) // historical reasons
let queue = dispatch_get_global_queue(qos, 0)
```

These queues can be used for work that won't block the main queue.

#### Create serial queue

If you need serialization. E.g. downloading a bunch of things from a certain website but you don't want to deluge that website, so you queue the request up serially *OR* maybe the things you are doing depend on each other in a serial fashion.

``` swift
let serialQ = dispatch_queue_create("name", DISPATCH_QUEUE_SERIAL)
```

## Do something in the future

You almost always `dispatch_after` into the main queue. All other queues are anyway concurrent and can't guarantee time delay's.

``` swift
let delayInSeconds = 25.0
let delay = Int64(delayInSeconds*Double(NSEC_PER_MSEC))
let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay) // adds delay to now
dispatch_after(dispatchTime, dispatch_get_main_queue()) {
  // do something on the main queue 25 seconds from now
}
```

## Other Things

There's a lot more Multithreading stuff.

- locking
- protect critical sections
- readers and writers
- synchronous dispatch
- etc. ...

## Multithreading iOS API

Many API are multithreaded and wont work on the main queue. Theirs works need to be dispached elsewhere.

``` swift
let session = NSURLSESSION(NSURLSessionConfiguration.defaultSessionConfiguration())
if let url = NSURL("http://url") {
    let request = NSURLRequest(URL:url)
    // not working
    let task = session.downloadTaskWithRequest(request) { (localURL, response, error) in
        // Here you can'r do UI Stuff with the result of the download!!
    }
    // working
    let task = session.downloadTaskWithRequest(request) { (localURL, response, error) in
        dispatch_async(dispatch_get_main_queue()) {
            // Here you can do UI related stuff
        }
    }
task.reasume()
}
```

In the above example the UI code has been dispatched back to the main queue. But understand that the code might run **MINUTES** after the request is fired off. The user might have long ago given up on whatever was being fetched.
