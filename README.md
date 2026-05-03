# my-homebrew-tap

[ikaro1192/PanInfraSpec](https://github.com/ikaro1192/PanInfraSpec) の Homebrew tap。

## Install

```sh
brew tap ikaro1192/tap
brew install paninfraspec
```

または one-liner:

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

macOS Intel / Linux 向けバイナリの tarball が upstream に追加された段階で
`Formula/paninfraspec.rb` に対応する `on_intel` / `on_linux` ブロックを足してください。

## Releasing a new version

upstream で新しい release が切られたら、以下を更新します。

1. `version` を新タグに合わせる
2. 各 asset の `sha256` を `gh release view vX.Y.Z --repo ikaro1192/PanInfraSpec --json assets` で取得して差し替える
3. `brew install --build-from-source ./Formula/paninfraspec.rb` と `brew test paninfraspec` で確認
