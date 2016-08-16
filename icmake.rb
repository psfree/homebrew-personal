class Icmake < Formula
  homepage 'http://icmake.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/icmake/icmake/7.22.01/icmake_7.22.01.orig.tar.gz'
  sha256 'b522e7937e9d4f0bec738dfce371673e3c4a8bc9f4d209a51631e5ed59ba66c7'

  def install
    # Fix sed syntax
    inreplace "scripts/conversions", %-\\\+-, %-\*-

    (buildpath/"INSTALL.im").atomic_write <<-EOS.undent
      #define BINDIR      "Cellar/#{name}/#{version}/bin"
      #define SKELDIR     "Cellar/#{name}/#{version}/share/icmake"
      #define MANDIR      "Cellar/#{name}/#{version}/share/man"
      #define LIBDIR      "Cellar/#{name}/#{version}/libexec"
      #define CONFDIR     "etc/icmake"
      #define DOCDIR      "Cellar/#{name}/#{version}/share/doc/icmake"
      #define DOCDOCDIR   "Cellar/#{name}/#{version}/share/doc/icmake-doc"
    EOS

    system "./icm_bootstrap", "#{HOMEBREW_PREFIX}"
    system "./icm_install", "strip", "all", "/"
  end
end
