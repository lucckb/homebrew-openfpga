class Nextpnr < Formula
  desc "Place and Route Tool for ECP5 FPGAs"
  homepage "https://github.com/YosysHQ/nextpnr"
  url "https://github.com/YosysHQ/nextpnr/archive/2d406f3e275beda8b70b4c7d4d5e43433dd3c43c.tar.gz"
  version "20200524"
  sha256 "276fef420ec921d8d966f180d8825f73cae056e02d1553181f0fe532ef1bb8dd"
  head "https://github.com/YosysHQ/nextpnr.git"

  option "without-gui", "No GUI"
  option "without-python", "No python scripting support"
  option "with-static", "Build with static libraries"
  option "with-arch-generic", "Enable generic arch support"
  option "without-arch-ice40", "Disable support for Lattice iCE40 FPGAs"
  option "without-arch-ecp5", "Disable support for Lattice ECP5 FPGAs"

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  depends_on "boost"
  depends_on "boost-python3"
  depends_on "eigen"
  depends_on "icestorm" if build.with? "arch-ice40"
  depends_on "prjtrellis" if build.with? "arch-ecp5"
  depends_on "qt" if build.with? "gui"
  depends_on "python" if build.with? "python"

  def install
    args = []
    args << "-DBUILD_GUI=OFF" if build.without? "gui"
    args << "-DBUILD_PYTHON=OFF" if build.without? "python"
    args << "-DSTATIC_BUILD=ON" if build.with? "static"

    archs = []
    archs << "ice40" if build.with? "arch-ice40"
    archs << "ecp5" if build.with? "arch-ecp5"
    archs << "generic" if build.with? "arch-generic"
    args << ("-DARCH=" << archs.join(";"))

    stable_version_commit = @stable.url[/([a-f0-9]{8})[a-f0-9]{32}\.tar\.gz/,1]
    stable_version = @stable.version.to_s+" ("+stable_version_commit+")"
    args << "-DCURRENT_GIT_VERSION="+stable_version unless build.head?
    args << "-DCURRENT_GIT_VERSION="+head.version.commit if build.head?

    system "cmake", *args, ".", "-GNinja", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "#{bin}/nextpnr-ecp5", "--help" if build.with? "arch-ecp5"
    system "#{bin}/nextpnr-ice40", "--help" if build.with? "arch-ice40"
  end
end
