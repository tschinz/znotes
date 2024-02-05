---
tags:
- security
- gnupg
- enrytion
---

# GnuPg
![](img/gnupg.svg){.center width="20%"}

## Encryption in Linux

To encrypt you need to do the following tasks

1.  Install GnuPG
2.  Creating a key pair
3.  Learn to use public keys
4.  Learn Encrypt & Decrypt
5.  Learn Sign & Verify

## The System

Briefly and without technical detours, the system works as follows. To encrypt and decrypt with GPG, it is necessary to use two different cryptographic keys: a public and a secret key.  "Public" keys are used to encrypt and "Private" keys are used to decrypt messages. To send encrypted e.g. e-mails you must have the "public" key of the recipient, which is used to encrypt the message. The recipient then uses his "Private" key to decrypt (and read) the encrypted message. To send encrypted messages to you, senders must first have a copy of your "public" key from your keychain. "Public" keys may be passed on to those who want to send you encrypted messages. For this purpose you can deposit your "Public" Key on a Key Server. "Private" keys may not be passed on.

!!! note
    **Key distributionAllocation of keys** "Private" keys may not be passed on to anyone, "Public" keys must be distributed to everyone.

## Installation of GnuPG

### Create of a key pair

``` bash
# Generate of the key pair
gpg --gen-key

# View key informations
gpg --list-keys

# Send key to a keyserver
gpg --send-keys --keyserver wwwkeys.pgp.net <key-id>
```

### Import of public key

``` bash
# Get public key from keyserver
gpg --recv-keys --keyserver wwwkeys.pgp.net keyid

# import into the keychain
gpg --import
```

## Encryption

``` bash
# Encrypt1
gpg --encrypt filename or gpg -e filename

# Decrypt
gpg --decrypt filename or gpg -d filename

# Sign
gpg --sign filename or gpg -s filename

# Verify
gpg --verify filename or gpg -v filename
```

## Links

- [Official GnuPG Webpage](http://www.gnupg.org)
- [Key Server](http://www.keys.pgp.net)
- [HowTo GnuPG](https://help.ubuntu.com/community/GnuPrivacyGuardHowto)
