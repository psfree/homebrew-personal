require "formula"

class Safecopy < Formula
  homepage "http://safecopy.sourceforge.net"
  url "https://downloads.sourceforge.net/project/safecopy/safecopy/safecopy-1.7/safecopy-1.7.tar.gz"
  sha1 "25a82fb0bf96f0d0e56a64dba93277df8035684f"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"

    # OSX does not have O_RSYNC
    inreplace "src/safecopy.c", "O_RSYNC", "O_SYNC"

    system "make", "install"
  end
end
