# Emacs, Y'all

This is me trying to finally get my Emacs life ironed out, compartmentalized, and replicable across machines. I think it's finally getting to an acceptible place. I'm pretty sure this works in Emacs 24; it definitely does for Emacs 25.

## Packages

I've spent a little bit of time making package bootstrapping automatic across machines, and not letting package.el to crap all over my files. This maybe be of some interest to others! And, conversely, possibly not!

## Modes

Mode setups are a bit chaotic at the moment, particularly in the JS realm; I'm trying to get the modern React-based stack to be nice and adhere to per-project standards. In some cases indentation seems to deviate a bit from expectations in RJSX mode, but if you have Prettier configured it'll do the right thing on save.
