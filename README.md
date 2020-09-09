# needle-kit #
a small, light weight and portable little tool for injecting code or text to any other file or replacing a keyword with another one. 

## INSTALL ## 

```
git clone https://github.com/user951/needle-kit.git

cd needle-kit/
chmod +x needle
```

Now for the usage

```

./needle [option 1-2]  [File with code to inject]  [File to inject code to]  [solve (this only works for option 1)]  [Item to replace]  [Replace item to]

```

## EXAMPLE WITH OPTION 1 ## 

**Common injection**
```
./needle 1 code.txt  inject_me.*  
```

**Solve injection option 1**

```
./needle 1 code.txt  inject_me.*  solve  "exit"  "#"
```

This will change any "exit" lines to "#"

## EXAMPLE WITH OPTION 2 ##
```
./needle 2 "type your code in ""  or  '' "  [file to inject code to] 
```



