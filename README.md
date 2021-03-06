# Matt's dot files

Just my dot files. Use them if you can...

## Installation

Clone the repository and submodules:

```sh
git clone git@github.com:matiaskorhonen/dotfiles.git
# or git clone https://github.com/matiaskorhonen/dotfiles.git
git submodule init
git submodule update
```

There's a Rake task that you can use to install the appropriate symlinks, but
it's pretty crude and makes some assumptions (for example that Oh My Zsh is
installed in `~/.oh-my-zsh`)

## Caveats

* Some of the configuration (e.g. the [RVM](https://rvm.io/) configuration in .rvmrc) might be specific to my set-up.
* I don't take responsibility for anything at all
* If you're going to use these dotfiles, you should probably fork this repo and edit as necessary
* If you install `git` **and** `zsh` from homebrew, you should make sure to specify the `--without-completions` option (otherwise you get conflicts)
  * OS X 10.9 (Mavericks) comes with zsh 5.0.2, so upgrading zsh from homebrew shouldn't be necessary
