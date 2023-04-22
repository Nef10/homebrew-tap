class ExportAsProtos < Formula
  include Language::Python::Shebang

  desc "Command-line Tool to export a beancount ledger to a protocol buffer text file"
  homepage "https://github.com/beancount/beancount"
  url "https://github.com/Nef10/beancount-code/archive/0798f4d944c4761f26fa344b2f6659b1ff995588.tar.gz"
  version "0798f4d944c4761f26fa344b2f6659b1ff995588"
  sha256 "91c6130fee0096482a144e1198898322c5f546f2811f476130c463e806f5e45c"
  license "GPL-2.0-only"

  depends_on "bazel" => :build
  depends_on "rsync" => :build
  depends_on :macos
  depends_on "numpy"
  depends_on "python@3.10"

  def install
    ENV.prepend_path "PATH", Formula["python@3.10"].opt_libexec/"bin"
    system "bazel", "build", "//experiments/v3/protos:export_as_protos"
    # replace symlinks to tmp dir with actual files
    system "rsync", "bazel-bin/experiments/v3/protos/export_as_protos.runfiles/",
                    "copy.runfiles/", "-a", "--copy-links", "-v"
    rewrite_shebang detected_python_shebang, "bazel-bin/experiments/v3/protos/export_as_protos"
    prefix.install "bazel-bin/experiments/v3/protos/export_as_protos"
    (prefix/"export_as_protos.runfiles").install Dir["copy.runfiles/*"]
    bin.install_symlink "#{prefix}/export_as_protos"
  end

  test do
    (testpath/"a").write "2000-01-01 open Assets:Cash EUR"
    system "#{bin}/export_as_protos", "a", "b"
    assert_predicate testpath/"b", :exist?
    expected = <<~EOF
      #---
      # 1
      #
      location {
        filename: "a"
        lineno: 1
      }
      date {
        year: 2000
        month: 1
        day: 1
      }
      open {
        account: "Assets:Cash"
        currencies: "EUR"
      }


    EOF
    assert_equal expected, File.read(testpath/"b")
  end
end
