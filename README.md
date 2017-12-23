# doctest-driver-gen

[![Hackage version](https://img.shields.io/hackage/v/doctest-driver-gen.svg?label=Hackage)](http://hackage.haskell.org/package/doctest-driver-gen)
[![Build Status](https://travis-ci.org/Hexirp/doctest-driver-gen.svg?branch=master)](https://travis-ci.org/Hexirp/doctest-driver-gen)
[![Stackage LTS](https://www.stackage.org/package/doctest-driver-gen/badge/lts)](https://www.stackage.org/lts/package/doctest-driver-gen)
[![Stackage Nightly](https://www.stackage.org/package/doctest-driver-gen/badge/nightly)](https://www.stackage.org/nightly/package/doctest-driver-gen)

doctest-driver-gen is a doctest's driver file generator. It lets you automatically generate driver file for [doctest's cabal integration](https://github.com/sol/doctest/blob/master/README.markdown#cabal-integration).

## Usage

```haskell
{-# OPTIONS_GHC -F -pgmF doctest-driver-gen [-optF DOCTEST_OPTION]... #-}
```

Make your driver file with the content.

## Motivation

This package was motivated by [doctest-discover](https://hackage.haskell.org/package/doctest-discover). I want a simpler doctest's driver file generator.
