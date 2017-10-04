# doctest-driver-gen

doctest-driver-gen is a doctest driver file generator. It lets you automatically generate driver file for doctest's cabal integration.

## Usage

```haskell
{-# OPTIONS_GHC -F -pgmF doctest-driver-gen [-optF OPTION]... #-}
```

Make your driver file with the content. `OPTION` is doctest's option. You can see help with `doctest --help`.
