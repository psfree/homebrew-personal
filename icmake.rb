require 'formula'

class Icmake < Formula
  homepage 'http://icmake.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/icmake/icmake/7.22.00/icmake_7.22.00.orig.tar.gz'
  sha1 '5b3b5a629b8b47276832fa6672279d4c4147c639'

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
