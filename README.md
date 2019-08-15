# Sarandos's Dotfiles

* Feel free to skip the goals/requirements. It's mostly me rambling through my process to make sure I'm not forgetting things.
* I maintain this repo as _my_ dotfiles
* You're quite welcome to use them, but you probably shouldn't use them as-is because they'll likely not suit your needs.
* You're welcome to make suggestions/raise issues/etc.

## Table of Contents

1. Goals/Requirements
1. Setup
1. Configuration
1. Contributing
1. Resources
1. License

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

I moved my secrets and cleaned up my files to some extent, but after a few days
research into available dotfiles tools, my goals changed to:

1. **Be able to document/see changes** (git)
1. **Load configs for multiple envs** (dotbot)
1. **keep secrets *protected*, yet in sync with the rest of the system** (dotbot + custom bash functions)
1. **Allow for easy integration of other projects** (git submodules)

Now almost 3 weeks later I finally have my secrets buttoned up and am making an
initial commit

## Setup

### Installing and Using

These dotfiles are managed using
[dotbot](https://github.com/anishathalye/dotbot) / [git
submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

#### installing

* fork this repo
* clone the forked repo to your user's $HOME/.dotfiles:

  ```BASH
  ~$ git clone --recursive https://github.com/sarandi/dotfiles ~/.dotfiles
  ```

* cd to the cloned directory
* setup install.conf.yaml (The following steps will be changing soon)
* run `./install`

#### using

* add/remove files by grouping them arrays passed to setSources() in
  .bash_profile
  * (the sourcing method has been abstracted from [Mathias Bynen's bash_profile](https://github.com/mathiasbynens/dotfiles/blob/master/.bash_profile))

  ```SHELL
    main=($HOME/.{exports,path,apps,filesystem,utils,bash_prompt,macos});
    setSources "$(echo ${main[*]})";
  ```

  * run `./install`
  * verify updates
* if you're updating already sourced files, you don't need to run `./install`

#### maintenance

* update install.conf.yaml to map files
* commit/push changes you want
* or [cherrypick commits](https://git-scm.com/docs/git-cherry-pick) you like from others

## Configuration

Please refer to [dotbot's configuration](https://github.com/robobenklein/dotbot#configuration) for how to structure your configuration files.

<!--## Wiki

Will consider if necessary

-->

## Contributing

As stated initially I am completely open to constructive feedback and dialog. If you have a case to make for a particular change - especially if you think may improve this configuation - please feel free to open an issue.

If you want to do the work yourself, you can fork/clone/develop and issue a pull request. In any case I reserve the right to ultimately decline the change, though if so I'll do my best to provide a good reason.

## Resources

This project is cobbled together by  mny ideas gleaned from the following sources. Thank you to all their authors and contributors.

1. <https://github.com/mathiasbynens/dotfiles>
1. <https://github.com/paulirish/dotfiles>
1. <https://github.com/magicmonty/dotfiles_dotbot>
1. <https://github.com/vsund/dotfiles>
1. <https://github.com/vbrandl/dotfiles>

## TODOs

1. consider making binaries from functions/scripts
    1. [shc](https://github.com/neurobin/shc)
1. hgj

## License

Copyright (c) 2012-2019 Sarandos Klikizos. Released under the MIT License. See [LICENSE.md] for details.
