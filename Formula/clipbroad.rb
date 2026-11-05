class Clipbroad < Formula
  desc "Share the clipboard between your own machines, peer-to-peer"
  homepage "https://github.com/fcamus00/clipbroad"
  url "https://github.com/fcamus00/clipbroad/releases/download/v0.4.1/clipbroad-v0.4.1-macos-aarch64.tar.gz"
  sha256 "45be2eab32d6cad3beb22a1aa4d3c6852afbd72c9daa45d0b358084f9ea109f1"
  license any_of: ["MIT", "Apache-2.0"]

  # Releases only ship an Apple Silicon build.
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "clipbroad"
  end

  def caveats
    <<~EOS
      To start clipbroad at login, run:
        clipbroad service install
      After an upgrade, run it again to restart the daemon on the new version.
    EOS
  end

  test do
    assert_equal "clipbroad #{version}", shell_output("#{bin}/clipbroad --version").strip
  end
end
