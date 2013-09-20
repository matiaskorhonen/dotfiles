Matt's dot files
================

Just my dot files. Use them if you can...

## Installation

There's a Rake task that you can use to install the appropriate symlinks, but
it's pretty crude and assumes some things (for example that Oh My Zsh is
installed in `~/.oh-my-zsh`)

## Caveats

* Some of the configuration (e.g. the [RVM](https://rvm.io/) configuration in .rvmrc) might be specific to my set-up.
  * Especially the `CFLAGS` (which are [GCC and CPU specific](http://en.gentoo-wiki.com/wiki/Safe_Cflags))
* I don't take responsibility for anything at all
* If you're going to use these dotfiles, you should probably fork this repo and edit as necessary
* If you install `git` **and** `zsh` from homebrew, you should make sure to specify the `--without-completions` option (otherwise you get a conflicts)
