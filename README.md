Hadler.sh
       Handler - Start Interactive Program

USAGE
(Handler.sh Must be run a root)
## Option 1
       Is for Starting a normal TCP listener (For waiting on a connection Or Message)

# Option 2
       Is  for  Runnig  a fast Scan for any Open ports on a system (For finding for backdoor open
       ports)

# Option 3
       Is for Trying to send a Client Packet to a host on a port  (For  Using  Bind  Backdoor  or
       Finding information about Port)

# Option 4
       [MIGHT  FAIL]  Is  for  Brute-forcing a host's port with a range of ports (For Finding and
       connecting to secret or hidden open TCP ports)

# Option 5
       Exit Handler



needle.sh
       needle.sh - Start Injection file

(needle.sh Is not need root)
## Common usage
# Normal Injection

' needle.sh [1-2] [File_with_code] [File_to_inject] '

# Complex Injection (solve)
`needle.sh [1] [File_with_code] [File_to_inject] [solve] ["Change_this"]  ["To_this"]`

## Complex usage
# Complex Injection (solve) [EXAMPLE]
# File 1
       "Very crappy code ;-;"
# File 2
       "Hi I'm the target HELLO HELLO HELLO HELLO"

# Code
      ' needle.sh 1 file1 file2 solve "HELLO" "I Got changed" '


# File1
       "Very crappy code ;-;"


# File2
       "Very crappy code ;-; Hi I'm the target I Got changed I Got changed I Got  changed  I  Got
       changed"



