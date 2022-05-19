require "language/node"

  class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.18"
  url "https://registry.npmjs.org/@hesketh-racing/leapp-cli/-/leapp-cli-0.1.18.tgz"
  sha256 "2d933515729b2a68120750d458545b96eeb6fe8a0aa64432219569c28ef5b677"

  depends_on "node@16"
  depends_on "libsecret"
  depends_on "python" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec).reject { |a| a == "--build-from-source" }
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end
