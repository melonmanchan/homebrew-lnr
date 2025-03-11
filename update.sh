
#!/usr/bin/env bash

set -eo pipefail

DIR="$(cd "$(dirname "${0}")" && pwd)"
cd "${DIR}"

sha256() {
  if ! type sha256sum >/dev/null 2>/dev/null; then
    if ! type shasum >/dev/null 2>/dev/null; then
      echo "sha256sum and shasum are not installed" >&2
      return 1
    else
      shasum -a 256 "$@"
    fi
  else
    sha256sum "$@"
  fi
}

if [ -z "${1}" ]; then
  echo "usage: ${0} version" >&2
  exit 1
fi

VERSION="${1}"

ARM_URL="https://github.com/melonmanchan/lr/releases/download/v${VERSION}/lr-macos-arm64.zip"
ARM_SHA256=$(curl -sSL "${ARM_URL}" | sha256 | cut -f 1 -d ' ')

X64_URL="https://github.com/melonmanchan/lr/releases/download/v${VERSION}/lr-macos-x64.zip"
X64_SHA256=$(curl -sSL "${X64_URL}" | sha256 | cut -f 1 -d ' ')

rm -rf Formula
mkdir -p Formula
cat <<EOF >Formula/lr.rb
class Lr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lr"
  head "https://github.com/melonmanchan/lr.git", branch: "main"
  version "${VERSION}"
  license "MIT"
  
  if Hardware::CPU.arm?
    url "${ARM_URL}"
    sha256 "${ARM_SHA256}"
  else
    url "${X64_URL}"
    sha256 "${X64_SHA256}"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "lr-macos-arm64/lr"
    else
      bin.install "lr-macos-x64/lr"
    end
  end

  test do
    system "#{bin}/lr --version"
  end
end
EOF
