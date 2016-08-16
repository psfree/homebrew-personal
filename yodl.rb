class Yodl < Formula
  homepage "https://fbb-git.github.io/yodl/"
  url "https://github.com/fbb-git/yodl/archive/3.05.00.tar.gz"
  sha256 "e13d40b759197f432337220959c7acef8cb8ac0fa58f81b21db0c425d47a9c8c"

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
