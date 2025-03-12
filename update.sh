
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

RELEASE_URL="https://github.com/melonmanchan/lnr/releases/tag/v${VERSION}"

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$RELEASE_URL")

if [ "$HTTP_CODE" -ne 200 ]; then
  echo "Error: received HTTP status code $HTTP_CODE while looking up release $RELEASE_URL"
  exit 1
fi

OSX_ARM_URL="https://github.com/melonmanchan/lnr/releases/download/v${VERSION}/lnr-macos-arm64.zip"
OSX_ARM_SHA256=$(curl -sSL "${OSX_ARM_URL}" | sha256 | cut -f 1 -d ' ')

OSX_X64_URL="https://github.com/melonmanchan/lnr/releases/download/v${VERSION}/lnr-macos-x64.zip"
OSX_X64_SHA256=$(curl -sSL "${OSX_X64_URL}" | sha256 | cut -f 1 -d ' ')

LINUX_ARM_URL="https://github.com/melonmanchan/lnr/releases/download/v${VERSION}/lnr-linux-arm64.zip"
LINUX_ARM_SHA256=$(curl -sSL "${LINUX_ARM_URL}" | sha256 | cut -f 1 -d ' ')

LINUX_X64_URL="https://github.com/melonmanchan/lnr/releases/download/v${VERSION}/lnr-linux-x64.zip"
LINUX_X64_SHA256=$(curl -sSL "${LINUX_X64_URL}" | sha256 | cut -f 1 -d ' ')

rm -rf Formula
mkdir -p Formula
cat <<EOF >Formula/lnr.rb
class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "${VERSION}"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "${OSX_ARM_URL}"
      sha256 "${OSX_ARM_SHA256}"
    else
      url "${OSX_X64_URL}"
      sha256 "${OSX_X64_SHA256}"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "${LINUX_ARM_URL}"
      sha256 "${LINUX_ARM_SHA256}"
    else
      url "${LINUX_X64_URL}"
      sha256 "${LINUX_X64_SHA256}"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
EOF
