Make it Rain
============

We aim to build a thin, extensible and pretty `Makefile` for simple C/C++ projects. If you find your Makefile complex for simple projects, try our Makefiles!


## Features

*  Pretty and sane interface.
*  Multi-compiler ( gcc, clang, vscode )
*  Multi-platform ( LINUX, WINDOWS, MAC)
*  Easy compile configuration with the old dogs `CFLAGS` and `LDFLAGS`
*  Support for `doctests`

## Installation

The simplest way is to use the provided `Makefile`.

1. Copy the `Makefile` to your project root.
2. Copy the folder `makerain`
3. Configure your project editing `Makefile` 

## Usage

| Description      | command      	            | 
|--------------	   | --------------	            |
| make             | Compile all files         	| 
| make info        | Display build information 	| 
| make run         | Run generated executable   |
| make debug       | Run with debugger attached |
| make doctest     | Compile `doctest`          | 
| make test        | Runs `doctest` 	        | 


## HOW TO: Overwrite config options ?

The traditional behaviour of overwriting
on the shell still apply. For example:

#### Use clang as compiler
> CXX=clang CX=clang make

#### Compiling with DEBUG symbols
> TARGET=DEBUG make

## Examples

A barebones App with dynamic library support is included in the directory `examples`.

## DI(WH)Y

```
When the sins of my father
Weigh down in my soul
And the pain of my mother
Will not let me go
Well, I know there can come fire from the sky
To refine the purest of kings
```

## Thanks to:

* [Andrew belt](https://andrewbelt.name/) for his simple design on [VCVRack](https://github.com/VCVRack/Rack), his code was a inspiration for this tool.
* [Milton Nascimento](https://www.youtube.com/watch?v=ji0BILoWwN8) for saving my life with his music.

## LICENSE WTFYW (for poor people)

Permission is granted to do whatever the fuck you want.

### But if you're rich or a company...

```
Yes, you, iphone user, owner of a house, citizen of a "1º world" country. 70k or more per year...

If that's the case, you're forbidden to use, copy and redistribute any parts of the source code, without paying in full the costs (USD $250 dollars) to the author, or donating
the mighty dollah to another open source project.
```
###### Robots are exempt of all taxes and dues.

## Proudly made in Brazil 🏖