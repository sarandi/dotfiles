# Sarandos's Dotfiles

* These dotfiles are managed using
[dotbot](https://github.com/anishathalye/dotbot) and [git
submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).
* Feel free to skip the goals/requirements. It's mostly me rambling through my process to make sure I'm not forgetting things.
* I maintain this repo as _my_ dotfiles
* You're quite welcome to pick and choose from my settings, but you probably shouldn't use them as-is because they'll likely not suit your needs.
* You're welcome to make suggestions/raise issues/etc.

## Table of Contents

1. [Goals/Requirements](#Goals/Requirements)
1. [Setup](#Setup)
1. [Configuration](#Configuration)
1. [Contributing](#Contributing)
1. [Resources](#Resources)
1. [TODOs](#TODOs)
1. [License](#License)

## Goals/Requirements

I started this project as a section for a "book" (link someday?), the topic of
which is how to improve processes endemic to software development.

Part of my process for any project, software or otherwise, is to establish a
small set of goals that will help me get started. As I begin work, the
complexities of the work unfold and I rework the goals as often as needed to
keep things moving and focused on the next big task.

My initial goals were:

1. Keep my secrets safe
1. Get my dotfiles on github

I moved my secrets and cleaned up my files to some extent, but after a few days research into available dotfiles tools, my goals changed to:

1. **Be able to document/see changes** (git)
1. **Load configs for multiple envs** (dotbot)
1. **keep secrets *protected*, yet in sync with the rest of the system** (dotbot + custom bash functions)
1. **Allow for easy integration of other projects** (git submodules)

Now almost 3 weeks later I finally have my secrets buttoned up and am making an
initial commit

## Setup

### Installing

* fork this repo in github (unless you are me)
* clone the forked repo to $HOME/.dotfiles:

  ```SHELL
  ~$ git clone --recursive https://github.com/sarandi/dotfiles ~/.dotfiles
  ```

### Using

To use these dotfiles, use dotbot to load a set of [configuration](#Configuration) files.

* You can install one or more profile with:

  ```SHELL
  ./install-profile <profile> [<configs...>]
  ```

* Single configurations can be installed with:

  ```SHELL
  ./install-standalone <configs...>
  ```

* To unload your current configs, simply install with the set you wish to be using; The install scripts are [idempotent](https://en.wikipedia.org/wiki/Idempotence), so the old set will be cleaned and only the new set will be used.

#### Sourcing

My [.bash_profile](.bash_profile) makes resources available by using the `source` command. I'm avoiding the use of `source` alias `. <filename>` in preference of clarity over arcanity.

* Add/remove files by grouping them into arrays and passing to setSources() for example, in [.bash_profile](.bash_profile#L20):

  ```SHELL
    main=($HOME/.{path,apps,filesystem,utils,macos});
    loadSources "$(echo ${main[*]})";
  ```

  * [My sourcing function](.bash_profile#L9) has been abstracted from [Mathias Bynen's bash_profile](https://github.com/mathiasbynens/dotfiles/blob/master/.bash_profile#L7)

* if you're updating already installed and sourced files, you don't need to run `./install-profile profile(s)` but you *do* need to either:
  * start a new shell
    * via your terminal
    * same shell: issue `exec bash -l` [^1]
  * source the file in manually if you don't want to start a new shell
  * this also includes moving files

#### Extras

[TODO]

#### Maintenance

* update meta/base.yaml to set defaults and any shared configurations
* add/update meta/profiles/\<profile\> to define profile
* add/update meta/configs/\<config.yaml\> to symlink configs
* stage/commit/push changes
* or [cherrypick commits](https://git-scm.com/docs/git-cherry-pick) you like from others

## Configuration

### Overview

Please refer to [dotbot's configuration](https://github.com/robobenklein/dotbot#configuration) for how to structure your configuration files.

More specifically, I'm using the advanced setup [outlined here][0]. However, the initial install for this isn't yet documented completely, so I'm outlining it in the following section.

### Advanced Dotbot Install

1. Create your .dotfile directory - I use `.dotfiles`
1. In .dotfiles root, create and populate a `.gitignore` file
1. In .dotfiles root, initiate git with `git init`
1. Get the advanced dotbot install scripts and save them to .dotbot root
   1. [install-profile](https://github.com/anishathalye/dotbot/wiki/Tips-and-Tricks#install-profile)
   1. [install-standalone](https://github.com/anishathalye/dotbot/wiki/Tips-and-Tricks#install-standalone)
   1. N.B. Notice these don't use a file extension
1. In .dotfile root, create a config directory
    1. The default name is meta
    1. If you change from meta, you will have to update the `META_DIR` variables in  both the install scripts
1. Inside of meta create two more directories: `profiles` and `configs`
1. Your user should have read/write/execute priviledges for all files and directories
   1. You can set this recursively with `chmod -R 700 ~/.dotfiles`
   1. Or you can alter to fit your needs - I usually use `755`
1. In .dotfile root, install the dotbot git submodule:

    ```SHELL
    # Using ssh
    git submodule add git@github.com:anishathalye/dotbot.git meta
    ```

1. Setup your configuration files as follows

### Advanced Dotbot Configuration

Dotbot accepts both YAML or JSON. My files exclusively use YAML because though it is whitespace dependent, I find managing whitespace easier than managing matching brackets. This is a personal preference, so feel free to change things for your own configurations.

1. cd to the cloned directory
1. setup meta/configs/config.yaml files for each set of configurations
    1. this follows the convention set by dotbot:

        ```YAML
        - link:
          ~/.macos: os/macos/.macos
          ~/.tmux-os.conf: os/macos/.macos.tmux.conf
          #  vim: set filetype=yaml ts=4 sw=4 tw=0 et :
         ```

    1. task options: *default*, *link*, *clean*, *shell*
1. Setup `meta/profiles/<profile>` files for each profile
   1. this is simply an extensionless list of config files:

         ``` TEXT
         bin
         apps
         bash
         filesystem
         macos
         path
         utils
         vim
         ```

1. Follow the directions in [Setup#Installing](#INSTALLING) and [Setup#Using](#USING) to test and use your configs

<!--## Wiki

Will consider if necessary

-->

## Contributing

As stated initially I am completely open to constructive feedback and dialog. If you have a case to make for a particular change - especially if you think may improve this configuation - please feel free to open an issue.

If you want to do the work yourself, you can fork/clone/develop and issue a pull request. In any case I reserve the right to ultimately decline the change, though if so I'll do my best to provide a good reason.

## Resources

This project is cobbled together by many ideas gleaned from the following sources. Thank you to all their authors and contributors.

1. <https://github.com/mathiasbynens/dotfiles>
1. <https://github.com/paulirish/dotfiles>
1. <https://github.com/magicmonty/dotfiles_dotbot>
1. <https://github.com/vsund/dotfiles>
1. <https://github.com/vbrandl/dotfiles>

## TODOs

TODOs are now being logged at [TODO.md]

## License

Copyright (c) 2012-2019 Sarandos Klikizos. Released under the MIT License. See [LICENSE.md] for details.

[0]: (https://github.com/anishathalye/dotbot/wiki/Tips-and-Tricks#more-advanced-setup)
[^1]: https://stackoverflow.com/a/26747607/2124430
