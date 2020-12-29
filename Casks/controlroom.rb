cask "controlroom" do
  version "6530a8f1c4632a9c3633866c76585cf176b73b6f"
  sha256 "8101de1da7ebc58af06cfc3461a9ae74449141999584f03d36de0a5d19462187"

  url "https://github.com/twostraws/ControlRoom/archive/#{version}.zip"
  name "Control Room"
  desc "Take charge of your iOS Simulator"
  homepage "https://github.com/twostraws/ControlRoom/"

  shimscript = "#{staged_path}/buildAndExport.sh"
  exportdir = staged_path
  downloaddir = "#{staged_path}/ControlRoom-#{version}"

  app "#{exportdir}/ControlRoom.app"

  preflight do
    IO.write shimscript, <<~EOS
      #!/usr/bin/env zsh

      main() {
        getTeamID
        writeExportPlist
        writeXcconfig
        archive
        exportArchive
      }

      function getTeamID() {
        CERTIFICATES=$(security find-identity -p codesigning -v | awk '{$1=$2=""; print $0}' | sed '$d' | sed 's/  //g' | sed 's/"//g' | grep -v CSSMERR_TP_CERT_REVOKED)
        CERTIFICATE=$(echo $CERTIFICATES | grep @ | head -n 1) # first certificate containing an @ - personal teams certificates have the email adress instead of name
        TEAMID=$(security find-certificate -c "$CERTIFICATE" -p | openssl x509 -text | grep -o "OU=[^,]*" | grep -v Apple | sed s/OU=//g)
      }

      function writeExportPlist() {
        EXPORTPLIST="exportOptions.plist"

        cat > $EXPORTPLIST <<EOF
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>method</key>
        <string>development</string>
        <key>teamID</key>
        <string>${TEAMID}</string>
      </dict>
      </plist>
      EOF
      }

      function writeXcconfig() {
        XCCONFIG="brew.xcconfig"

        cat > $XCCONFIG <<EOF
      ONLY_ACTIVE_ARCH = YES
      EOF
      }

      function archive() {
        ARCHIVE="#{staged_path}/Export.xcarchive"
        xcodebuild -project "#{downloaddir}/ControlRoom.xcodeproj" -scheme "Release - ControlRoom" -xcconfig $XCCONFIG -archivePath $ARCHIVE archive
      }

      function exportArchive() {
        EXPORTPATH="#{exportdir}"
        xcodebuild -archivePath $ARCHIVE -exportArchive -exportPath $EXPORTPATH -exportOptionsPlist $EXPORTPLIST
      }

      main "$@"
    EOS

    set_permissions shimscript, "755"
    system_command shimscript
  end
end
