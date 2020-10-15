class DoxygenAT1813 < Formula
  desc "Generate documentation for several programming languages"
  homepage "http://www.doxygen.org/"
  url "https://downloads.sourceforge.net/project/doxygen/rel-1.8.13/doxygen-1.8.13.src.tar.gz"
  version "1.8.13"
  sha256 "af667887bd7a87dc0dbf9ac8d86c96b552dfb8ca9c790ed1cbffaa6131573f6b"

  depends_on "bison" => :build
  depends_on "cmake" => :build

  conflicts_with "doxygen", :because => "doxygen also installs a doxygen binary"

  def install
    args = std_cmake_args + %W[
      -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING=#{MacOS.version}
    ]

    mkdir "build" do
      system "cmake", "..", *args
      system "make"
    end
    bin.install Dir["build/bin/*"]
    man1.install Dir["doc/*.1"]
  end

  test do
    system "#{bin}/doxygen", "-g"
    system "#{bin}/doxygen", "Doxyfile"
  end
end
