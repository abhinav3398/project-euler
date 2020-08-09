# Project Euler

[project euler](https://projecteuler.net/)

## Dependencies

This is not a registered package so you need to add it with:

```julia
] add https://github.com/Wikunia/ProjectEulerDownload.jl
```

## USAGE: to get the problem

```julia
using ProjectEulerDownload
# to have a shorter notation
const PED = ProjectEulerDownload

# once =>
PED.configure("PATH TO YOUR PROJECT EULER ROOT DIRECTORY")

# then spcigy problem number
PED.download(1)
```