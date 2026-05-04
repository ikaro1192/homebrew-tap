class Paninfraspec < Formula
  desc "Dhall front-end for Serverspec that generates spec files"
  homepage "https://github.com/ikaro1192/PanInfraSpec"
  url "https://github.com/ikaro1192/PanInfraSpec/archive/refs/tags/v0.4.0.8.tar.gz"
  sha256 "684a7574e5574134cce423ec220c040e6048d6dbc69a0aa4929424fb4c690c81"
  license "MIT"
  head "https://github.com/ikaro1192/PanInfraSpec.git", branch: "main"

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build

  def install
    # cabal.project.freeze pins base to a version tied to a specific GHC
    # release. Homebrew's `ghc` formula tracks the latest GHC, so the freeze
    # would force unsatisfiable constraints. Drop it and let cabal solve
    # against whatever GHC Homebrew currently provides.
    rm_f "cabal.project.freeze"

    system "cabal", "v2-update"
    system "cabal", "v2-install", *std_cabal_v2_args
    prefix.install "LICENSE", "README.md"
  end

  test do
    assert_match "paninfraspec-gen", shell_output("#{bin}/paninfraspec-gen --help 2>&1")
  end
end
