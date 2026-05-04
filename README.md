# my-homebrew-tap

Homebrew tap for [ikaro1192/PanInfraSpec](https://github.com/ikaro1192/PanInfraSpec).

## Install

```sh
brew tap ikaro1192/tap
brew install paninfraspec
```

Or as a one-liner:

```sh
brew install ikaro1192/tap/paninfraspec
```

## Update

```sh
brew update
brew upgrade paninfraspec
```

## Uninstall

```sh
brew uninstall paninfraspec
brew untap ikaro1192/tap
```

## Build

This formula builds from source via `ghc` + `cabal-install`. The first install
will download a Haskell toolchain and compile the project, so it takes longer
than a typical bottle install. Subsequent upgrades reuse Homebrew's cached
GHC/Cabal.

## Supported platforms

| OS | Arch | Source |
| --- | --- | --- |
| macOS / Linux | any arch supported by GHC | upstream source tarball (built locally) |

## Releasing a new version

When a new release is cut upstream, update the following:

1. Bump the tag in `url` to match the new release (e.g. `v0.4.0.9`).
2. Replace `sha256` with `curl -sL <url> | shasum -a 256`.
3. Verify with `brew install --build-from-source ./Formula/paninfraspec.rb` and `brew test paninfraspec`.
