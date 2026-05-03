class Paninfraspec < Formula
  desc "Dhall front-end for Serverspec that generates spec files"
  homepage "https://github.com/ikaro1192/PanInfraSpec"
  version "0.3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ikaro1192/PanInfraSpec/releases/download/v#{version}/paninfraspec-#{version}-darwin-arm64.tar.gz"
      sha256 "b0cf98e5e0c1a599459e82e2331d84230066939b808bdbffe0fa1cb4fdcec520"
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
