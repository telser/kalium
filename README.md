# Sodium

This is a Pascal to Haskell translator. The ultimate goal is to generate
idiomatic functional code from imperative code. The project is under heavy
development, so nothing is documented.


## Building

Like in many other Haskell projects, Cabal is used as the building system. You
are advised to install all the dependencies listed in the corresponding section
of the `*.cabal` file using your system package manager. In case you don't have
recent enough libraries, feel free to loosen the lower bounds -- chances are
that it will work, as I don't bother checking backwards compatibility and simply
require the latest versions.

Then build the project itself with `cabal build`.


## Structure

*Sodium* consists of a library that contains all the functionality and an
extremely small command-line tool. There are three parts of the library:

* Front-end: `Sodium.Pascal`
* Core: `Sodium.Nucleus`
* Back-end: `Sodium.Haskell`

The distinction between these parts is kept clear to allow front/back-ends for
other languages in the future. The command-line tool isn't ready for use yet,
and for now it's suitable for debug purposes only.

There are also some helper modules, such as `Control.Monad.Counter`.


## Contributing

Contact me on GitHub if you feel adventurous and want to contribute.