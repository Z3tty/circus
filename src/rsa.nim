import std/strformat
import std/sugar
import std/math

proc phi(p: int, q: int): int =
  return (p-1) * (q-1)

proc gcd(n: int, m: int): int = 
  var
    a = n
    b = m
  while a != b:
    if a > b:
      a -= b
    else:
      b -= a
  return a

proc mtoi(message: string): int = 
  var intval: string = ""
  for ch in message:
    intval = intval & char(int(ch))
  return int(intval)

proc stom(crypt: seq[str]): string = 
  var message = ""
  var i = 0
  while i - 1 < crypt.len:
    let append = char(int(crypt[i] & crypt[i+1]))
    message = message & append
    i += 1
  return message

proc calcDecrypt(e: int, pN: int): int =
  var d = 0
  while true:
    if (e * (d mod pN) == 1):
      return d
    else:
      d += 1

proc encrypt(message: string, enc: int, n: int) =
  let c = mtoi(message)
  return (c^enc) mod n

proc decrypt(crypt: string, dec: int, n: int) = 
  let c = int(crypt)
  let m = (crypt^dec) mod n
  return itom(toSeq(string(m))

let p: int = 99999991783
let q: int = 59999991241

let N: int = p * q

let e: int = 17
let d: int = calcDecrypt(e, phi(p, q))

echo fmt"e:{e}, d{d}, N:{N}"
let message = "RSA encryption test"
let encrypted = encrypt(message, e, N)
let decrypted = decrypt(encrypted, d, N)
echo fmt"message: {message}, E: {encrypted}, D: {decrypted}"