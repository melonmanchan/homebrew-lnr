class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.3.2"
  license "MIT"

  head do
    url "https://github.com/melonmanchan/lnr.git", branch: "main"
    depends_on "deno" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.2/lnr-macos-arm64.zip"
      sha256 "5d353f6de2bee31ce6ab905c6de83ba2f3b828072b6d0f19a161762bd3aa1375"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.2/lnr-macos-x64.zip"
      sha256 "b737a1c3f3ab8c236c834581652fcbe533ba8935793fb3e16f624606704237c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.2/lnr-linux-arm64.zip"
      sha256 "395900f1da9acba666ba0844304f0ea04308ad87f1dbd77703d4c6c1b4ed1258"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.2/lnr-linux-x64.zip"
      sha256 "e908f14a6621eb54e618be1a86bba5813771a1a21715a9e0300d10369a05ed47"
    end
  end

  def install
    if build.head?
      system "deno", "install"

      if OS.mac?
        if Hardware::CPU.arm?
          system "deno", "task", "compile:macos-arm64"
          bin.install "lnr-macos-arm64/lnr" => "lnr"
        else
          system "deno", "task", "compile:macos-x64"
          bin.install "lnr-macos-x64/lnr" => "lnr"
        end
      else # Linux
        if Hardware::CPU.arm?
          system "deno", "task", "compile:linux-arm64"
          bin.install "lnr-linux-arm64/lnr" => "lnr"
        else
          system "deno", "task", "compile:linux-x64"
          bin.install "lnr-linux-x64/lnr" => "lnr"
        end
      end
    else
      bin.install "lnr"
    end
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
