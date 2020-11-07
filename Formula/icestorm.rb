class Icestorm < Formula
  desc "Bitstream Tools for Lattice iCE40 FPGAs"
  homepage "http://www.clifford.at/icestorm/"
  url "https://github.com/cliffordwolf/icestorm/archive/da52117ccd5b4147f64dc7345357ec5439cd7543.tar.gz"
  version "20201107"
  sha256 "bef024225097944b145b844518d1fee53bab2cc85634252fea09da48fb631cbf"
  head "https://github.com/cliffordwolf/icestorm.git"
  patch :DATA

  depends_on "pkg-config" => :build
  depends_on "gnu-sed" => :build
  depends_on "libftdi0"
  depends_on "python"


  def install
    system "make", "install", "PREFIX=#{prefix}", "PRETTY=0"
  end

  test do
    system "#{bin}/iceprog", "--help"
  end
end
__END__
diff --git a/icebox/Makefile b/icebox/Makefile
index 2897dfb..3eff9c2 100644
--- a/icebox/Makefile
+++ b/icebox/Makefile
@@ -56,27 +56,27 @@ install: all
 	cp icebox_maps.py    $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_maps$(PY_EXE)
 	cp icebox_vlog.py    $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
 	cp icebox_stat.py    $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_stat$(PY_EXE)
-	sed -i 's+import iceboxdb+import $(subst -,_,$(PROGRAM_PREFIX))iceboxdb as iceboxdb+g' $(DESTDIR)$(PREFIX)/bin/$(subst -,_,$(PROGRAM_PREFIX))icebox.py
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_chipdb$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_diff$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_diff$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_explain$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_explain$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_asc2hlc$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_asc2hlc$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_hlc2asc$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_hlc2asc$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_colbuf$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_colbuf$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_html$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_html$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_maps$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_maps$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
-	sed -i 's+/usr/local/share/icebox+$(PREFIX)/share/$(PROGRAM_PREFIX)icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
-	sed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_stat$(PY_EXE)
-	sed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_stat$(PY_EXE)
+	gsed -i 's+import iceboxdb+import $(subst -,_,$(PROGRAM_PREFIX))iceboxdb as iceboxdb+g' $(DESTDIR)$(PREFIX)/bin/$(subst -,_,$(PROGRAM_PREFIX))icebox.py
+	gsed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_chipdb$(PY_EXE)
+	gsed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_diff$(PY_EXE)
+	gsed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_diff$(PY_EXE)
+	gsed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_explain$(PY_EXE)
+	gsed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_explain$(PY_EXE)
+	gsed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_asc2hlc$(PY_EXE)
+	gsed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_asc2hlc$(PY_EXE)
+	gsed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_hlc2asc$(PY_EXE)
+	gsed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_hlc2asc$(PY_EXE)
+	gsed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_colbuf$(PY_EXE)
+	gsed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_colbuf$(PY_EXE)
+	gsed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_html$(PY_EXE)
+	gsed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_html$(PY_EXE)
+	gsed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_maps$(PY_EXE)
+	gsed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_maps$(PY_EXE)
+	gsed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
+	gsed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
+	gsed -i 's+/usr/local/share/icebox+$(PREFIX)/share/$(PROGRAM_PREFIX)icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_vlog$(PY_EXE)
+	gsed -i 's+import icebox+import $(subst -,_,$(PROGRAM_PREFIX))icebox as icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_stat$(PY_EXE)
+	gsed -i 's+from icebox+from $(subst -,_,$(PROGRAM_PREFIX))icebox+g' $(DESTDIR)$(PREFIX)/bin/$(PROGRAM_PREFIX)icebox_stat$(PY_EXE)
 
 uninstall:
 	rm -f $(DESTDIR)$(PREFIX)/bin/$(subst -,_,$(PROGRAM_PREFIX))cebox.py
