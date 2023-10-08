class Harpwise < Formula
  desc "Harmonica practice-utility for the command-line using microphone and speaker"
  homepage "https://github.com/marcIhm/harpwise"
  url "https://github.com/marcihm/harpwise/archive/4.6.2.tar.gz"
  sha256 "615a3de6b298cc9313e6156aed72f980ed6791351aaddb5f1da2422405384800"
  license "MIT"

  depends_on "aubio"
  depends_on "coreutils"
  depends_on "figlet"
  depends_on "ruby"
  depends_on "sox"
  depends_on "toilet"

  def install
    # harpwise is written in ruby, but is not a gem.
    man1.install "man/harpwise.1"
    File.write("libexec/harpwise", "#!/bin/bash\n\n#{prefix}/harpwise $@\n")
    bin.install("libexec/harpwise")
    prefix.install Dir["*"]
  end

  test do
    # Selftest for frequency-pipeline (sox + aubio) and generation of
    # big chars (figlet + toilet).  For a much more extensive
    # test-suite see test/run_tests.rb.
    system "#{bin}/harpwise", "develop", "selftest"
  end
end
