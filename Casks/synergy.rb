cask :v1 => 'synergy' do
  version 'v1.7.3-stable-efd0108'

  if MacOS.release == :snow_leopard
    sha256 'fe6495c8714b0cf1796a053f4153836191a8a514b81f2464c0fa1f6492020497'
    url "http://synergy-project.org/files/nightly/synergy-#{version}-MacOSX106-i386.dmg"
  elsif MacOS.release == :lion
    sha256 '189e6eb0753a8f3acacfd76172bdbd71ba82cdb7d53af70657bd8c7486d3203b'
    url "http://synergy-project.org/files/nightly/synergy-#{version}-MacOSX107-x86_64.dmg"
  elsif MacOS.release == :mountain_lion
    sha256 '774414cb53d40b67b3afe64357b1593dd8c514752b731e0b46db9609b9dbee2d'
    url "http://synergy-project.org/files/nightly/synergy-#{version}-MacOSX108-x86_64.dmg"
  elsif MacOS.release == :mavericks
    sha256 '898b0c35ca69918e30e72bf1aaabbf17cb612c80516145034d52f6155f8edfc5'
    url "http://synergy-project.org/files/nightly/synergy-#{version}-MacOSX109-x86_64.dmg"
  else
    sha256 '58fb287a2a48e6723615c8eb858a7fc6981c677c4b78330118f720c0f493f88f'
    url "http://synergy-project.org/files/nightly/synergy-#{version}-MacOSX1010-x86_64.dmg"
  end

  homepage 'http://synergy-project.org'
  license :oss

  app 'Synergy.app'

  depends_on :macos => %w{
                          :snow_leopard
                          :lion
                          :mountain_lion
                          :mavericks
                          :yosemite
                         }
end
