class Deviceconsole < Formula
  homepage "http://rpetri.ch"
  head "https://github.com/rpetrich/deviceconsole.git"

  def install
    system "make"

    bin.install('deviceconsole')
  end
end
