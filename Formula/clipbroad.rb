class Clipbroad < Formula
  desc "Share the clipboard between your own machines, peer-to-peer"
  homepage "https://github.com/fcamus00/clipbroad"
  url "https://github.com/fcamus00/clipbroad/releases/download/v0.1.0/clipbroad-v0.1.0-macos-aarch64.tar.gz"
  sha256 "8e3812a576779d61110d45113110f5557ff6e61f41d7bd4d4b328bde20f659ad"
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
