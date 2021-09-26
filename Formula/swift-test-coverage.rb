class SwiftTestCoverage < Formula
  desc "Command Line Tool to display the test coverage of a swift package"
  homepage "https://github.com/Nef10/swift-test-coverage"
  url "https://github.com/Nef10/swift-test-coverage/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "6eafd010f6e0904a48044d62f32665b487bdc54980d327821316269ae514cb22"
  license "MIT"

  def install
    bin.install "swift-test-coverage"
  end

end
