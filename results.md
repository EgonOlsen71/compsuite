# Compiler Test Results

## Native C64 Compiler

| Compiler | Result                                                                                                         |
|---|----------------------------------------------------------------------------------------------------------------|
| Austro | no errors                                                                                                      |
| Basic 64 | error in "Integer overflow 4", infinite loop at "Exit endless loop"                                            |
| Basic-Boss | error in "Integer overflow 4", crash at "FOR loop 6"                                                           |
| Blitz | no errors                                                                                                      |
| HypraComp | error in "Integer overflow 2+4", error in "Boolean 1", error in "FOR loop 4+6", type mismatch in "DATA access" |
| Laser Compiler | infinite loop at "Exit endless loop"                                                                           |
| Petspeed | error in "Random numbers", infinite loop at "Exit endless loop"                                                |
| Speedcompiler | does not compile the FOR loop tests                                                                            |

## Cross-Compiler

| Compiler                 | Result                                                                                                                                                   |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| MOSpeed (1.0.7.1)        | no errors                                                                                                                                                |
| YAB (0.9.11)             | BASIC error when reading DATA lines for setup                                                                                                            |
| ABC (version 2026-08-30) | error in "Integer overflow 2+4", error in "Random numbers", error in "Boolean 1+2", BASIC error in "FOR loop 1", ignores upper/lower case in source code |
