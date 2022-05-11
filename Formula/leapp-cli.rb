require "language/node"

  class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.12"
  url "https://registry.npmjs.org/@hesketh-racing/leapp-cli/-/leapp-cli-0.1.12.tgz"
  sha256 "378943f0600ef8ca466772ed76b1c7430ba8d111fede23e4822a988cfd4f47b1"

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
