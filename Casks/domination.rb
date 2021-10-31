cask "domination" do
  version "1.2.4"
  sha256 "e097258d9ed738d4f66883c131ca10e5ceab6caf598a1a03dfcf83fff0e02757"

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
