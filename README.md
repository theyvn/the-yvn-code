<div id="the-yvn-code-logo" align="center">
    <br />
    <img src="./docs/assets/logo.png" alt="THE YVN CODE Logo" width="200"/>
    <h1>THE YVN CODE</h1>
    <h3>Code editor by THE YVN — based on VS Code, free from telemetry</h3>
</div>

<div id="badges" align="center">

[![license](https://img.shields.io/github/license/the-yvn/the-yvn-code.svg)](https://github.com/the-yvn/the-yvn-code/blob/master/LICENSE)

</div>

**THE YVN CODE — редактор кода под брендом THE YVN, основанный на открытом исходном коде VS Code (через VSCodium). Без телеметрии Microsoft, с кастомными расширениями и AI-интеграцией.**

## Содержание

- [Скачать/Установить](#download-install)
- [Сборка](#build)
- [Зачем это существует](#why)
- [Поддерживаемые платформы](#supported-platforms)
- [Лицензия](#license)

## <a id="download-install"></a>Скачать/Установить

Скачать последний релиз:
[stable](https://github.com/the-yvn/the-yvn-code/releases)

### GNU/Linux

```bash
# .deb (Ubuntu/Debian)
sudo dpkg -i yvncode_*.deb

# .rpm (Fedora/RHEL)
sudo rpm -i yvncode_*.rpm
```

### Windows

Скачайте `.exe` установщик из [релизов](https://github.com/the-yvn/the-yvn-code/releases).

## <a id="build"></a>Сборка

Инструкции по сборке: [docs/howto-build.md](https://github.com/the-yvn/the-yvn-code/blob/master/docs/howto-build.md)

## <a id="why"></a>Зачем это существует

THE YVN CODE — это кастомная сборка VS Code под брендом THE YVN:

- **Без телеметрии** — вся телеметрия Microsoft отключена
- **Открытый код** — бинарники под лицензией MIT
- **Свой маркетплейс** — используется [Open VSX Registry](https://open-vsx.org/) вместо Microsoft Marketplace
- **AI-интеграция** — встроенная поддержка AI-ассистентов (в разработке)

Сборка основана на скриптах [VSCodium](https://github.com/VSCodium/vscodium), которые клонируют репозиторий Microsoft vscode, применяют патчи и собирают свободные бинарники.

### Расширения и маркетплейс

THE YVN CODE использует [open-vsx.org](https://open-vsx.org/) — открытый реестр расширений для VS Code.

Некоторые расширения Visual Studio Code имеют лицензии, ограничивающие их использование официальными сборками VS Code.

## <a id="supported-platforms"></a>Поддерживаемые платформы

- [x] GNU/Linux x64 (`deb`, `rpm`, `AppImage`, `tar.gz`)
- [x] GNU/Linux arm64 (`deb`, `rpm`, `tar.gz`)
- [x] Windows 10+ x64
- [x] Windows 10+ arm64
- [x] macOS 10.15+ x64
- [x] macOS 11.0+ arm64

## <a id="license"></a>Лицензия

[MIT](https://github.com/the-yvn/the-yvn-code/blob/master/LICENSE)

---

> Based on [VSCodium](https://github.com/VSCodium/vscodium) — Free/Libre Open Source Software Binaries of VS Code
