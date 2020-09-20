##Complex Injection (solve)
      ` needle.sh [1] [File_with_code] [File_to_inject] [solve] ["Change_this"]  ["To_this"]`

(=================================================================================)
# Complex Injection (solve) [EXAMPLE]
File 1
       "Very crappy code ;-;"
File 2
       "Hi I'm the target HELLO HELLO HELLO HELLO"

Code
       needle.sh 1 file1 file2 solve "HELLO" "I Got changed"

(=================================================================================)
File1
       "Very crappy code ;-;"


File2
       "Very crappy code ;-; Hi I'm the target I Got changed I Got changed I Got  changed  I  Got
       changed"

(=================================================================================)


