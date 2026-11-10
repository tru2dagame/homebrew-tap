class Rexurrect < Formula
  desc "Save Rex sessions and recreate them after the Rex server stops"
  homepage "https://github.com/tru2dagame/rexurrect"
  version "0.4.0-tru.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/tru2dagame/rexurrect/releases/download/v0.4.0-tru.1/rexurrect-aarch64-apple-darwin.tar.xz"
      sha256 "92f1daf28d60c2628b145dd39ff088aabb3bd8250406f45bede1d4beda56fa74"
    end
  end
  license "MIT"
  depends_on :macos
  depends_on arch: :arm64

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "rexurrect"
    end

    install_binary_aliases!

    pkgshare.install "rexurrect.plugin.zsh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rexurrect --version")
  end
end
