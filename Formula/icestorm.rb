class Icestorm < Formula
  desc "Bitstream Tools for Lattice iCE40 FPGAs"
  homepage "http://www.clifford.at/icestorm/"
  url "https://github.com/cliffordwolf/icestorm/archive/cd2610e0fa1c6a90e8e4e4cfe06db1b474e752bb.tar.gz"
  version "20200520"
  sha256 "bef024225097944b145b844518d1fee53bab2cc85634252fea09da48fb631cbf"
  head "https://github.com/cliffordwolf/icestorm.git"

  depends_on "pkg-config" => :build
  depends_on "libftdi0"
  depends_on "python"

  def install
    system "make", "install", "PREFIX=#{prefix}", "PRETTY=0"
  end

  test do
    system "#{bin}/iceprog", "--help"
  end
end
