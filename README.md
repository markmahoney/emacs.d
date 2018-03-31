# Emacs, Y'all

This is me trying to finally get my Emacs life ironed out, compartmentalized, and replicable across machines. I think it's finally getting to an acceptible place. I'm pretty sure this works in Emacs 24; it definitely does for Emacs 25.

## Packages

I've spent a little bit of time making package bootstrapping automatic across machines, and not letting package.el crap all over my files. This maybe be of interest to others! And, conversely, it may not!

## Modes

Mode setups are a bit chaotic at the moment, particularly in the JS realm; I'm trying to get the modern React-based stack to be nice and adhere to per-project standards. In some cases RJSX mode JSX/ES6 indentation seems to deviate from standard expectations, but if you have Prettier configured it'll do the right thing on save (though I don't have a good non-hardcoded, per-project way to configure Prettier yet).
