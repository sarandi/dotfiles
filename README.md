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
1. [Resources](#)
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

### Installing and Using

#### Installing

* fork this repo
* clone the forked repo to your user's $HOME/.dotfiles:

  ```BASH
  ~$ git clone --recursive https://github.com/sarandi/dotfiles ~/.dotfiles
  ```

#### Using



* add/remove files by grouping them arrays passed to setSources() in
  .bash_profile
  * the sourcing method has been abstracted from [Mathias Bynen's bash_profile](https://github.com/mathiasbynens/dotfiles/blob/master/.bash_profile)

  ```SHELL
    main=($HOME/.{path,apps,filesystem,utils,macos});
    loadSources "$(echo ${main[*]})";
  ```

  * run `./install-profile profile1 [profile2,...]`
  * verify updates
* if you're updating already sourced files, you don't need to run `./install-profile profile(s)`

#### Maintenance

* update meta/base.yaml to set defaults and any shared configurations
* add/update meta/profiles/\<profile\> to define profile
* add/update meta/configs/\<config.yaml\> to symlink configs
* stage/commit/push changes
* or [cherrypick commits](https://git-scm.com/docs/git-cherry-pick) you like from others

## Configuration

### Overview

Please refer to [dotbot's configuration](https://github.com/robobenklein/dotbot#configuration) for how to structure your configuration files.

More specifically, I'm using the complex configuration/install process outline [here](#).

### Complex Dotbot Configuration

* cd to the cloned directory
* setup meta/configs/config.yaml files for each set of configurations
  * this follows the convention set by dotbot:

  ```YAML
  - link:
    ~/.macos: os/macos/.macos
    ~/.tmux-os.conf: os/macos/.macos.tmux.conf
    #  vim: set filetype=yaml ts=4 sw=4 tw=0 et :
   ```

  * task options: *default*, *link*, *clean*, *shell*
* setup meta/profiles/profile files for each profile
  * this is simply an extensionless list of config files:

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

* run `./install-profile profile1 [profile2,...]` to install any combination of profiles

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
