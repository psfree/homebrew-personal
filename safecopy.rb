class Safecopy < Formula
  homepage "http://safecopy.sourceforge.net"
  url "https://downloads.sourceforge.net/project/safecopy/safecopy/safecopy-1.7/safecopy-1.7.tar.gz"
  sha256 "42fbed5d4764020eb0f34d95e97a0e14e62d801c3ef80f89bd497d94d39cc4fd"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"

    # OSX does not have O_RSYNC
    inreplace "src/safecopy.c", "O_RSYNC", "O_SYNC"

    system "make", "install"
  end
end
