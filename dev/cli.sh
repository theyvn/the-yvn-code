export CARGO_NET_GIT_FETCH_WITH_CLI="true"
export VSCODE_CLI_APP_NAME="the yvn code"
export VSCODE_CLI_BINARY_NAME="yvncode-server-insiders"
export VSCODE_CLI_DOWNLOAD_URL="https://github.com/the-yvn/the-yvn-code-insiders/releases"
export VSCODE_CLI_QUALITY="insider"
export VSCODE_CLI_UPDATE_URL="https://raw.githubusercontent.com/the-yvn/versions/refs/heads/master"

cargo build --release --target aarch64-apple-darwin --bin=code

cp target/aarch64-apple-darwin/release/code "../../VSCode-darwin-arm64/THE YVN CODE - Insiders.app/Contents/Resources/app/bin/yvncode-tunnel-insiders"

"../../VSCode-darwin-arm64/THE YVN CODE - Insiders.app/Contents/Resources/app/bin/yvncode-insiders" serve-web
