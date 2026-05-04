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

## Supported platforms

| OS | Arch | Source |
| --- | --- | --- |
| macOS | arm64 (Apple Silicon) | upstream prebuilt tarball |

Once upstream publishes tarballs for macOS Intel or Linux, add the corresponding
`on_intel` / `on_linux` blocks to `Formula/paninfraspec.rb`.

## Releasing a new version

When a new release is cut upstream, update the following:

1. Bump `version` to match the new tag.
2. Replace each asset's `sha256`, fetched via `gh release view vX.Y.Z --repo ikaro1192/PanInfraSpec --json assets`.
3. Verify with `brew install --build-from-source ./Formula/paninfraspec.rb` and `brew test paninfraspec`.
