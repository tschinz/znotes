---
tags:
- security
- password
---

# Password
![](img/password_strength.png){.center width="100%"}


In order to have a secure password you must do the following take care of

1.  Control your passwords
2.  Create new secure password and memorize it
3.  Change password regularly

## Introduction

Who does not know this: you have registered with a new service, or on the server the monthly password change is pending, and you cannot and do not remember a password that meets the requirements of the security concept: either, it is too short, or it is not cryptic enough, or it is too cryptic and you cannot remember it. Finally, because you don't feel like it anymore, you choose any password you like, unfortunately mostly insecure ones.

With this little article I would like to raise security awareness as well as make it easier to choose a secure password by understanding how such a password is constructed. However, I want to say right from the start: assigning secure passwords requires a lot of discipline from the user himself!

## Why a secure password is important

Many people think of NOTHING when assigning passwords. But this process is extremely important.

A lot of computer crime could be avoided if more end users would overcome their "inner bastard" and assign reasonable passwords. But to the same extent the shop operators, security officers and others responsible for password acceptance or password suggestions are to blame: I have never seen a web shop with plausibility checks of the password. In addition, general passwords should also be chosen securely for webshops to avoid unauthorized spying of customer passwords.  I am sure that many will say "Who would want to harm me of all people", or "Who would want to read my e-mails of all people". But that is not the point. The attacker does not (usually) care whose account password he gets. He is also not necessarily interested in your e-mails. He is only interested in how he gets into  he system. Because

-   Place no. 2: Number combinations, which remind of a product, such as 4711, 911, X5, A6.
-   Place no. 3: The word "Password" itself
-   Place no. 4: Pet names like treasure.
-   Place no. 5: The word "Baby".
-   Place no. 6: Seasons like summer and winter.
-   Place no. 7: The word hello.
-   Place no. 8: Names of big cities like Zurich, Paris or NewYork.
-   Place no. 9: Your own first names.
-   Place no. 10: The first name of your wife / girlfriend / husband

## Structure of a (relatively) secure password

A secure password consists of upper and lower case letters and numbers. It contains no (perceptible) systematic and is at least 8 characters

Security freaks tend to use so-called "keyboard hacks" to generate passwords. This is a one-time, pointless and blind ten-finger hack on the keyboard - you don't remember the password in general, but only the character string as it is entered on the keyboard. Such passwords are of course extremely "secure". Because if you have to enter a password in th  presence of other people, for example, you should be able to do so unobtrusively and quickly. In such a situation, anyone who has to rely on the "eagle system" to enter a password will only make it easier for those present to unobtrusively follow the entered  haracter string.

!!! note
    Good passwords should therefore be a middle ground between strings that cannot be guessed and strings that can be remembered. A keyboard hack is.

## Password Generator

If you are too uncreative to think up your own "secure" password, you can use the following page to automatically generate easy-to-remember but nevertheless secure passwords of different lengths.

- [Keepass](https://keepass.info/)
- [Safepasswd](http://www.safepasswd.com)
- [Generista](http://generista.com)

![](img/password_generator.png){.center width="50%"}

## Password Reuse

A complete unique password should always be created per platform. Variations can be detected and exploited relatively quickly.

![](img/password_reuse.png){.center}

## How long should a password be

The question is not so easy to answer. That depends on the security area. Generally speaking, a minimum length of 8 characters is reasonable: 8 characters mean 191707312997281 combinations for character class a-zA-Z1-9 (= 61 characters). At one million keystrokes per second, this would mean a maximum time of about 53252 hours (191707312.997281 seconds) (almost 6 years). That is quite a respectable time :-)

Let's have a small table for an estimation: Minimum length maximum time required (assuming 1 million keystrokes per second)

Number of Symbols  | Brute Force Time
------------------ | ----------------
 3 Symbols         |  0,2 Seconds
 5 Symbols         |  14 Minutes
 8 Symbols         |  53252 Hours
 12 Symbols        |  84168853 Year
 15 Symbols        |  19104730610573 Years

But now comes the disillusionment. All these are so-called maximum times! Maximum time means: if someone tries to crack the password at the specified speed and only the very last character combination entered is the correct one, then it takes as long as specified. But theoretically, the very first character combination entered could be correct. Then it took only a hundred thousandth of a second to crack the password - despite 15 characters. It is therefore quite possible that an attacker could have found out a password within a few seconds. Just coincidence. Therefore, 8 characters are not a good reason to be on the safe side. In addition, it also depends on the computing power: a million tansten strokes per second were expected. Other, better, later built computers can handle millions of times that. This also pushes more and more into the foreground with the graphics cards brute-force attacks. As an example a new Nividia graphics card with CUDA has 256 processor cores, the clock frequency of such a core can be about 500MHz. This allows the graphics card to test 128E9 = 128000000000 passwords per second.

Of course one should also add that many access systems throw a logging in guest out of the system after so many failed attempts. Then, if he wants to try again, he has to log in with a new identity, in the internet e.g. sometimes also with a different IP address. An attacker can automate such things to a certain extent, however.

## Links

- [Wikipedia article about password](http://en.wikipedia.org/wiki/Password)
- [Helpful article](http://aktuell.de.selfhtml.org/artikel/gedanken/passwort/)

