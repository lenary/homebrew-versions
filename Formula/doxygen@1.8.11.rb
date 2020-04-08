class DoxygenAT1811 < Formula
  desc "Generate documentation for several programming languages"
  homepage "http://www.doxygen.org/"
  url "https://downloads.sourceforge.net/project/doxygen/rel-1.8.11/doxygen-1.8.11.src.tar.gz"
  sha256 "65d08b46e48bd97186aef562dc366681045b119e00f83c5b61d05d37ea154049"
  version "1.8.11"

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
