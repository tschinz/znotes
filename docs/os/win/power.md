---
tags:
- os
- operating system
- windows
- power
---
# Power

## `powercfg`

``` bat
:: List available powerstates
powercfg /devicequery /?

:: Lists devices be able to wake up the pc from sleep
powercfg /devicequery wake_programmable

:: Generates energy report
powercfg energy

:: Lists all available powerstates
powercfg -a

:: Last wakeup device
powercfg -lastwake

:: Turn of Hibernation (in admin console)
powercfg -H off
```

## `dumppo`

Basically there are 2 sleep states in Windows, S1 and S3. Most of the time all you have to do is set your BIOS sleep mode to "S3 only" and it should always use S3 sleep state. However you could also configure Windows to force S3 sleep state to ensure that your system saves maximum power. While I don't have exact figures because each PC is different, I can tell you that S1 sleep state only saves a couple of watts of power but S3 on the other hand only uses a couple watts of power and thus saves quite alot more.

Enter `dumppo admin` in a console to show the current state

``` bat
dumppo admin
```

``` bat
dumppo admin
 Admin policy overrides
 Min sleep state......: S1
 Max sleep state......: S4 - hibernate
 Min video timeout....: 0
 Max video timeout....: -1
 Min spindown timeout.: 0
 Max spindown timeout.: -1
```

Notice the minimum sleep state is S1 by default. Type the following command and press enter, `dumppo admin minsleep=S3`. You should now get the following information on the screen.

``` bat
dumppo admin minsleep=S3
```

``` bat
dumppo admin minsleep=S3
 Admin policy overrides
 Min sleep state......: S3
 Max sleep state......: S4 - hibernate
 Min video timeout....: 0
 Max video timeout....: -1
 Min spindown timeout.: 0
 Max spindown timeout.: -1
```