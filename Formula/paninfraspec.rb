class Paninfraspec < Formula
  desc "Dhall front-end for Serverspec that generates spec files"
  homepage "https://github.com/ikaro1192/PanInfraSpec"
  version "0.1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ikaro1192/PanInfraSpec/releases/download/v#{version}/paninfraspec-#{version}-darwin-arm64.tar.gz"
      sha256 "07c512841e1ee093dc031d646f2500519fb29a6c18abc65610b53b90b55fd848"
    end
  end

  def install
    bin.install "bin/paninfraspec-gen"
    prefix.install "LICENSE", "README.md"
  end

  test do
    assert_match "paninfraspec-gen", shell_output("#{bin}/paninfraspec-gen --help 2>&1")
  end
end
