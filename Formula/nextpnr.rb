class Nextpnr < Formula
  desc "Place and Route Tool for ECP5 FPGAs"
  homepage "https://github.com/YosysHQ/nextpnr"
  url "https://github.com/YosysHQ/nextpnr/archive/76ffdbbbdedcaa0c07af3b5f8abe881f4722605f.tar.gz"
  version "20201108"
  sha256 "e3344a9a933b426bc14cad31d7b24bcf33db046c19c6b332d2b938583df26dc6"
  head "https://github.com/YosysHQ/nextpnr.git"
  patch :DATA

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
  depends_on "python@3.9" if build.with? "python"

  def install
    args = []
    args << "-DBUILD_GUI=OFF" if build.without? "gui"
    args << "-DBUILD_PYTHON=OFF" if build.without? "python"
    args << "-DSTATIC_BUILD=ON" if build.with? "static"
    args << "Boost_PYTHON_FOUND=TRUE"

    archs = []
    archs << "ice40" if build.with? "arch-ice40"
    archs << "ecp5" if build.with? "arch-ecp5"
    archs << "generic" if build.with? "arch-generic"
    args << ("-DARCH=" << archs.join(";"))

    stable_version_commit = @stable.url[/([a-f0-9]{8})[a-f0-9]{32}\.tar\.gz/,1]
    stable_version = @stable.version.to_s+" ("+stable_version_commit+")"
    args << "-DCURRENT_GIT_VERSION="+stable_version unless build.head?
    args << "-DCURRENT_GIT_VERSION="+head.version.commit if build.head?
    args << "-DICEBOX_ROOT=/usr/local/share/icebox"
    args << "-DPYTHON_INCLUDE_DIR=/usr/local/Cellar/python@3.9/3.9.0_1/Frameworks/Python.framework/Versions/3.9/include/python3.9"


    system "cmake", *args, ".", "-GNinja", *std_cmake_args
    system "ninja"
    system "ninja", "install"
  end

  test do
    system "#{bin}/nextpnr-ecp5", "--help" if build.with? "arch-ecp5"
    system "#{bin}/nextpnr-ice40", "--help" if build.with? "arch-ice40"
  end
end
__END__
diff --git a/3rdparty/QtPropertyBrowser/src/qteditorfactory.cpp b/3rdparty/QtPropertyBrowser/src/qteditorfactory.cpp
index 7cd130f..4920f47 100644
--- a/3rdparty/QtPropertyBrowser/src/qteditorfactory.cpp
+++ b/3rdparty/QtPropertyBrowser/src/qteditorfactory.cpp
@@ -2205,7 +2205,6 @@ void QtColorEditWidget::setValue(const QColor &c)
 
 void QtColorEditWidget::buttonClicked()
 {
-    bool ok = false;
     QRgb oldRgba = m_color.rgba();
     QColor newRgba = QColorDialog::getColor(oldRgba, this).rgba();
     if (newRgba.isValid() && newRgba.rgba() != oldRgba) {
