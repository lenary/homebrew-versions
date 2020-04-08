class HugoExtended < Formula
  desc "Configurable static site generator (Extended Version)"
  homepage "https://gohugo.io"
  url "https://github.com/gohugoio/hugo/releases/download/v0.64.0/hugo_extended_0.64.0_macOS-64bit.tar.gz"
  version "0.64.0"
  sha256 "c31fbe48ec5a3c1b677abd2755a6fab2ae3baa7536382499243dc21ffd9ebd0e"

  def install
    bin.install "hugo"
  end

  test do
  end
end
