require "formula"

class Deviceconsole < Formula
  homepage ""
  head "https://github.com/rpetrich/deviceconsole.git"
  sha1 ""

  def install
    system "make"

    bin.install('deviceconsole')
  end
end
