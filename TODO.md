# Dotfiles TODOs & Questions

1. ~~Totally user's call. I will try it - Should extensions be represented with
a variable? (see EXT_PSD in newsp.sh for use case)~~
1. ~~Link README ToC~~
1. Finish going through Checked Files list below and adding notes from files
1. ~~Remove old install files~~
1. ~~Link README TODOs to this file~~
1. ~~going forward with this - consider making binaries from functions/scripts:
[shc](https://github.com/neurobin/shc)~~
1. ~~add .gitkeep to empty dirs~~
1. ~~Learn syntax for communicating unix commands/input/etc.~~
1. Define and Describe Extras setup in README
    1. This includes possibly using `inotify` to detect filesystem changes for
encryption/sourcing/unsourcing/archiving files
    1. Consider security around extra: gpg? sudo? UX must be seamless.
    1. gcloud stores unencrypted user data in $HOME/.config/gcloud
    1. How to handle .ssh?
1. Need to add `$HOME/.config` and any relevant files (consider how to handle
gcloud, et al)
1. How to include Fira Code font?
1. Build and test multiple profiles
1. Reorganize - architecture should reflect functionality
1. Create v0.0.1 and tag it

## Checked Files

All files have been checked for secrets. I need to go through and document notes/questions below so I have everything in one place.

```text
apps/
    .apps
bin/
    exports/ -> (removed)
        .ptgenv -> moved to extra/ptg.env
    filesystem
        .filesystem
    scripts
        .bash
        .bash_locations
        .gitx -> moved a function to extra/...
        .http
        .inputrc -> needs updating
        .keyboards -> consider merging with .inputrc
        .logs
        .mathFunctions
        .network
        .pabst -> moved to extra/ptg
        .processes
        .sort
        .textFunctions
        .watson -> this might eventually need to be moved to extra
        csv.csv -> moved to apps/.csv
    utils
        .utils
```
