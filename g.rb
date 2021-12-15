# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class G < Formula
  desc "Golang Version Manager"
  homepage "https://github.com/voidint/g"
  version "1.2.1"
  url "https://github.com/voidint/g/archive/v1.2.1.tar.gz"
  sha256 "863baabc56c43ada7a7d6390155101b9d0f911b88ed237ddee95a79c5dcb5efe"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    ENV["GOPROXY"] = "https://goproxy.io,direct"
    system "go", "build", "-o", bin/"g"
    prefix.install_metafiles
  end

  test do
    version_output = shell_output("#{bin}/g --version 2>&1")
    assert_match "g version", version_output
  end
end
