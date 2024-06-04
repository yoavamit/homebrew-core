  url "https://files.pythonhosted.org/packages/35/a5/52af77c7a347757c9890dcfbb10f5e13e8ef778dbc2cb8ff18cfc66c462e/ldeep-1.0.56.tar.gz"
  sha256 "bff4b348eecc80f307771cc0d49ec2f497430bdda9fbb78252455ade4c35eb00"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "af4a0c38d15a5a05033eae9238b8279d82e56c21c7ffe0088d32b865bb4c755c"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "748d40485d97afea26fdf9f940e67443b2db0875b11d86dadf27dbe0cb269f5a"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "a4c0712ef59a318c82fe9ee2a385d9cb5ac2980cbe92c6250584e7c100a7518b"
    sha256 cellar: :any_skip_relocation, sonoma:         "f8465bc04922b7e02ef74f11324b40494060c6a20e08dd7365526aecf609aaea"
    sha256 cellar: :any_skip_relocation, ventura:        "e68d6c1279a96589e1dbdeef4c257c67f10514ca9af4e0173781b809e71e00dd"
    sha256 cellar: :any_skip_relocation, monterey:       "17831ed678e34cdfcae13580eb843ce6eb5d12bbd6c80074f7a7e236c940af2e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "a1329833a5d423e95a4c6dd4f7e01c8e37af2c374c17e345e238928fbd5ec700"
  # add missing VERSION file, upstream pr ref, https://github.com/franc-pentest/ldeep/pull/78
  patch :DATA


__END__
diff --git a/VERSION b/VERSION
new file mode 100644
index 0000000..ed453e6
--- /dev/null
+++ b/VERSION
@@ -0,0 +1 @@
+1.0.56
diff --git a/pyproject.toml b/pyproject.toml
index fcb3ac1..8b58514 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -45,6 +45,12 @@ Homepage = "https://github.com/franc-pentest/ldeep"
 [project.scripts]
 ldeep = "ldeep.__main__:main"

+[tool.pdm.build]
+includes = [
+    "ldeep/**",
+    "VERSION",
+]
+
 [tool.pdm.version]
 source = "call"
 getter = "ldeep:get_version"