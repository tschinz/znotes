---
tags:
- coding
- scala
- libraries
---
# Libraries

## `scala.math._`

``` scala
import scala.math._

abs(-8)                       // Int = 8
ceil(5.45)                    // Double = 6.0
round(5.45)                   // Double = 5.0
floor(5.45)                   // Double = 5.0
exp(1)                        // Double = 2.7182818284590455
Pi                            // Double = 3.141592653589793
pow(2,2)                      // Double = 4.0
pow(2,16-1)                   // Double = 2^(16-1)
sqrt(pow(2,2) + pow(2,2))     // 2.8284271247461903
hypot(2,2)                    // 2.8284271247461903
log10(1000)                   // Double = 3.0
log(2.718281284590455)        // Double = 1.0
min(5, 10)                    // Int = 5
max(1, 1000)                  // Int = 1000
(random * (11 -1)).toInt      // Int = ...
toRadians(90)                 // Double = 1.5707963267948966
toDegrees(1.5707963267948966) // Double = 90.0

// acos, asin, atan, atan2, cos cosh, sin, sinh, tan, tanh
```

## `scala.sys.process._`

``` scala
import scala.sys.process._

cmd = "ls -la"
cmd!
```

## `java.util.Calendar`

``` scala
import java.util.Calendar

println(s"Start cordicPipelinedSim Simulation: ${Calendar.getInstance().getTime()}")
println(s"End cordicPipelinedSim Simulation: ${Calendar.getInstance().getTime()}")
```