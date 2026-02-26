#!/usr/bin/env bash
# Скрипт для встраивания русского языкового пакета в сборку THE YVN CODE
# Скачивает VSIX с Open VSX и распаковывает в папку extensions финального билда
# Вызывается из vscode/ директории через `. ../install_langpack.sh`

set -e

LANG_PACK_PUBLISHER="MS-CEINTL"
LANG_PACK_NAME="vscode-language-pack-ru"
LANG_PACK_ID="${LANG_PACK_PUBLISHER}.${LANG_PACK_NAME}"

# Определяем корень проекта (скрипт вызывается из vscode/)
ROOT_DIR="$(cd .. && pwd)"

# Определяем путь к папке extensions в зависимости от платформы
if [[ "${OS_NAME}" == "osx" ]]; then
  APP_NAME_SHORT="$( node -p "require('./product.json').nameShort" )"
  EXTENSIONS_DIR="${ROOT_DIR}/VSCode-darwin-${VSCODE_ARCH}/${APP_NAME_SHORT}.app/Contents/Resources/app/extensions"
elif [[ "${OS_NAME}" == "windows" ]]; then
  EXTENSIONS_DIR="${ROOT_DIR}/VSCode-win32-${VSCODE_ARCH}/extensions"
else
  EXTENSIONS_DIR="${ROOT_DIR}/VSCode-linux-${VSCODE_ARCH}/extensions"
fi

if [[ ! -d "${EXTENSIONS_DIR}" ]]; then
  echo "WARNING: Папка extensions не найдена: ${EXTENSIONS_DIR}"
  echo "Пропускаем установку языкового пакета"
  return 0 2>/dev/null || exit 0
fi

LANGPACK_DIR="${EXTENSIONS_DIR}/${LANG_PACK_NAME}"

echo "=== Установка русского языкового пакета ==="
echo "Целевая папка: ${LANGPACK_DIR}"

# Скачиваем VSIX с Open VSX
VSIX_URL="https://open-vsx.org/api/${LANG_PACK_PUBLISHER}/${LANG_PACK_NAME}/latest/file/${LANG_PACK_ID}.vsix"
VSIX_FILE="${ROOT_DIR}/_langpack_ru.vsix"

echo "Скачиваем: ${VSIX_URL}"
if command -v curl &> /dev/null; then
  curl -sL -o "${VSIX_FILE}" "${VSIX_URL}" || true
elif command -v wget &> /dev/null; then
  wget -q -O "${VSIX_FILE}" "${VSIX_URL}" || true
fi

if [[ ! -f "${VSIX_FILE}" || ! -s "${VSIX_FILE}" ]]; then
  echo "WARNING: Не удалось скачать VSIX, пропускаем"
  return 0 2>/dev/null || exit 0
fi

echo "VSIX скачан: $(du -h "${VSIX_FILE}" | cut -f1)"

# VSIX — это ZIP архив, распаковываем
TEMP_DIR="${ROOT_DIR}/_langpack_tmp"
rm -rf "${TEMP_DIR}"
mkdir -p "${TEMP_DIR}"

if command -v unzip &> /dev/null; then
  unzip -q -o "${VSIX_FILE}" -d "${TEMP_DIR}"
elif command -v 7z &> /dev/null; then
  7z x -o"${TEMP_DIR}" "${VSIX_FILE}" -y > /dev/null
elif command -v 7z.exe &> /dev/null; then
  7z.exe x -o"${TEMP_DIR}" "${VSIX_FILE}" -y > /dev/null
else
  echo "WARNING: Нет unzip или 7z, пропускаем"
  rm -f "${VSIX_FILE}"
  return 0 2>/dev/null || exit 0
fi

# Содержимое расширения находится в extension/ внутри VSIX
if [[ -d "${TEMP_DIR}/extension" ]]; then
  rm -rf "${LANGPACK_DIR}"
  mkdir -p "${LANGPACK_DIR}"
  cp -r "${TEMP_DIR}/extension/"* "${LANGPACK_DIR}/"
  echo "Языковой пакет установлен в: ${LANGPACK_DIR}"
else
  echo "WARNING: Не найдена папка extension/ в VSIX"
  ls -la "${TEMP_DIR}/" || true
fi

# Проверяем что language pack корректно установлен
if [[ -f "${LANGPACK_DIR}/package.json" ]]; then
  PACK_VERSION=$(node -p "require('${LANGPACK_DIR}/package.json').version" 2>/dev/null || echo "unknown")
  echo "Русский языковой пакет v${PACK_VERSION} успешно встроен"
fi

# Очистка
rm -rf "${TEMP_DIR}" "${VSIX_FILE}"

echo "=== Русский язык встроен в сборку ==="
