class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.10"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.10/lnr-macos-arm64.zip"
      sha256 "dd9a9beb31032bb51e223c17aa043175733aa7ce7f2b68aeb82b65dc54a741a3"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.10/lnr-macos-x64.zip"
      sha256 "351870fb4abb521d679e4123bb97ac46a366a4af9647e4c2a951a1ccea33faa7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.10/lnr-linux-arm64.zip"
      sha256 "614da45363334976a8d4d17a64d7cbf68819f9d0f031230d3260cd1a93399b6a"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.10/lnr-linux-x64.zip"
      sha256 "95b742fd218ff49aaf01463611fe2f9106c51e8d030e14aff8f73298dadb300e"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
