# Needle-Kit


## Installation 

```bash
(assuming you have git on your system)

git clone https://github.com/user951/Needle-Kit.git
chmod +x * 
./Handler.sh
[Handler.sh will also install any requiremnts]
```
or
```bash
wget https://github.com/user951/Needle-Kit/releases/download/v0.0.1/needle-kit.zip
unzip needle-kit.zip
cd needle-kit/
chmod +x *
./Handler.sh
```
## Usage

needle.sh has two option that is set at the beginning of the program {1-2}

Option 1 will let the user specify the location of a file the might hold anything from code to just plain text
```bash
bash needle.sh  1 {text file} {File to inject}
```
also, Option 1 is the only option that can use the "solve" Keyword.
```bash
bash needle.sh 1 {text file} {File to inject} solve "{replace to}"  "{keyword to replace to}
```
Keyword solve Solve will attempt to replace any words that the use tell it such as replacing any "Hello" ~> "Goodbye" at high speeds

Option 2 will just inject anything into the user inputs. (no solve)
```bash
bash needle.sh 2 {type the code here in ""} {file to inject}
```

## Contributing
Pull requests are welcome.
For major changes, please open an issue first to discuss what you would like to change.

## License 

[GNU LICENSE](https://github.com/user951/Needle-Kit/blob/master/LICENSE)
