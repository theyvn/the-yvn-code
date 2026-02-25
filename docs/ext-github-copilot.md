<!-- order: 16 -->

# Extension: GitHub Copilot

Unlike Visual Studio Code, in THE YVN CODE, Copilot features are disabled and not configured.

## Update your settings

In your settings, sets:
```
"chat.disableAIFeatures": false,
```

## Configure product.json

You need to create a custom `product.json` at the following location (replace `THE YVN CODE` by `THE YVN CODE - Insiders` if you use that):
- Windows: `%APPDATA%\THE YVN CODE` or `%USERPROFILE%\AppData\Roaming\THE YVN CODE`
- macOS: `~/Library/Application Support/THE YVN CODE`
- Linux: `$XDG_CONFIG_HOME/THE YVN CODE` or `~/.config/THE YVN CODE`

Then you will need to follow the guide [Running with Code OSS](https://github.com/microsoft/vscode-copilot-chat/blob/main/CONTRIBUTING.md#running-with-code-oss) with the `product.json` file created previously.
You will need to add the properties: `trustedExtensionAuthAccess` and `defaultChatAgent`.
