class Paninfraspec < Formula
  desc "PanInfraSpec is a pluggable, multi-target infrastructure spec generator."
  homepage "https://github.com/ikaro1192/PanInfraSpec"
  url "https://github.com/ikaro1192/PanInfraSpec/archive/refs/tags/v0.5.1.0.tar.gz"
  sha256 "4508c5ffbc4bf5a62d2718122702f53c2b98f8f94b2387b8393fbcda2607623d"
  license "MIT"
  head "https://github.com/ikaro1192/PanInfraSpec.git", branch: "main"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.6" => :build

  def install
    # Pin to GHC 9.6 to match cabal.project.freeze (base ==4.18.3.0).
    # ghc@9.6 is keg-only, so put it ahead of any system ghc on PATH.
    ENV.prepend_path "PATH", Formula["ghc@9.6"].opt_bin

    system "cabal", "v2-update"
    system "cabal", "v2-install", "--with-compiler=#{Formula["ghc@9.6"].opt_bin}/ghc",
                                  *std_cabal_v2_args
    prefix.install "LICENSE", "README.md"
  end

  test do
    assert_match "paninfraspec-gen", shell_output("#{bin}/paninfraspec-gen --help 2>&1")
  end
end
