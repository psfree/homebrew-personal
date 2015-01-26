require 'formula'

class KalibrateRtl < Formula
  homepage 'https://github.com/steve-m/kalibrate-rtl'
  head "https://github.com/steve-m/kalibrate-rtl.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on 'fftw'
  depends_on 'librtlsdr'

  def install
    # remove unused library reference
    inreplace "src/Makefile.am", " -lrt", ""

    system "./bootstrap"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
