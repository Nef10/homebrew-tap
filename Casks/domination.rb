cask "domination" do
  version "1.2.3"
  sha256 "e2b2526048123cc838eec1dc96f594b7ae16fce95757fdaadbaaac07a4531a7d"

  url "https://downloads.sourceforge.net/domination/Domination_#{version}.zip"
  appcast "https://sourceforge.net/projects/domination/rss?path=/Domination"
  name "yura.net Domination"
  desc "Risk Board Game"
  homepage "http://domination.sourceforge.net/"

  suite "Domination"

  caveats do
    depends_on_java
  end
end
