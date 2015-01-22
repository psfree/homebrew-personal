require "formula"

class Yodl < Formula
  homepage "http://yodl.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/yodl/yodl/3.05.00/yodl_3.05.00.orig.tar.gz"
  sha1 "ec430263ec52c9e6340307182e187aa5a7d128ae"

  depends_on "icmake" => :build

  def install
    # remove hardlink to icmake
    inreplace "build", %-bin/icmake-, %-bin/env icmake-

    # disable debugging
    inreplace "build", %-\+ " \-g"-, %--

    inreplace "INSTALL.im", %-"/usr"-, %-"#{prefix}"-

    system "./build", "programs"
    system "./build", "macros"

    system "./build", "install", "programs", "/"
    system "./build", "install", "macros", "/"
    system "./build", "install", "docs", "/"
  end
end
