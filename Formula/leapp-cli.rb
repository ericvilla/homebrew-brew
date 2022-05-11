require "language/node"

  class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.14"
  url "https://registry.npmjs.org/@hesketh-racing/leapp-cli/-/leapp-cli-0.1.14.tgz"
  sha256 "e1eb024f8d60e0988e320fb189275411f434e7e30bb638645c8f56a38368e2b3"

  depends_on "node@16"
  depends_on "libsecret"
  depends_on "python" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end
