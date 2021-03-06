class HugoExtended < Formula
  desc "Configurable static site generator (Extended Version)"
  homepage "https://gohugo.io"
  url "https://github.com/gohugoio/hugo/releases/download/v0.60.0/hugo_extended_0.60.0_macOS-64bit.tar.gz"
  version "0.60.0"
  sha256 "3a23d1003f567e81981ab9139c994c1107807008015b01fcfd8500cf9a0b9241"

  conflicts_with "hugo", :because => "hugo-extended also installs a hugo binary"

  def install
    bin.install "hugo"
  end

  test do
  end
end
