# Epic Mickey Android · Ultimate Port

Estrutura de **port nativo** para Android (ARM64, Android 10 a 15) do *Epic Mickey* e do *Epic Mickey 2: The Power of Two* (Nintendo Wii).

> **Leia antes:** nenhum dos dois jogos roda nesta build. Não existe código-fonte nem reimplementação
> pública e legal de nenhum dos dois. O projeto entrega tudo **em volta** do jogo (launcher, importador,
> controles, renderizador, gráficos, saves, áudio, CI) e um **contrato de backend** em C++ onde uma
> implementação real se encaixa. Sem backend, o app abre em **modo diagnóstico** e mostra isso na tela.
> Não é um emulador, não é WebView e não finge rodar o jogo. Veja [docs/STATUS.md](docs/STATUS.md).

Nenhuma ROM, ISO, BIOS, chave ou arquivo dos jogos está incluído. O app **não tem permissão de internet**.

## Gerar o APK no GitHub

1. Crie um repositório no GitHub e envie o conteúdo deste ZIP (a raiz precisa ter `settings.gradle.kts` e `.github/`).
2. Abra a aba **Actions**. O workflow **Android CI** roda sozinho a cada push (ou clique em *Run workflow*).
3. No fim, baixe os artefatos **EpicMickeyPort-debug-apk** e **EpicMickeyPort-release-apk**.

O `gradle-wrapper.jar` é binário e é gerado automaticamente pelo workflow. Pra assinar o release com a sua chave,
crie os secrets `EPICPORT_KEYSTORE_BASE64`, `EPICPORT_KEYSTORE_PASSWORD`, `EPICPORT_KEY_ALIAS` e `EPICPORT_KEY_PASSWORD`.
Sem eles, o release é assinado com a chave de debug (serve pra testar, não pra distribuir).

Build local: Android Studio (Ladybug+) ou `gradle wrapper --gradle-version 8.9 && ./gradlew assembleDebug` com JDK 17, SDK 35, NDK 27.0.12077973 e CMake 3.22.1.

## Módulos

| Módulo | Pasta | O que faz |
|---|---|---|
| Android Launcher | `app/` | Telas Compose, `GameActivity` (Surface + overlay + HUD), navegação |
| Game Importer | `importer/` | SAF, localização do disco extraído, boot.bin, main.dol, SHA-1, índice, .pak |
| Epic Mickey 1 Backend | `backend/em1/` | Status real do backend EM1 e ações suportadas |
| Epic Mickey 2 Backend | `backend/em2/` | Idem para EM2 |
| Engine (nativo) | `engine/` | `libepicport.so`: renderizador GLES3, barramento de entrada, leitor PAK, registro de backends, sonda Vulkan |
| Touch Controls | `controls/` | Modelo de layout, JSON/ZIP/PNG, overlay multitouch, gamepad |
| Layout Editor | `editor/` | Superfície de edição com grade, mover, redimensionar, undo/redo |
| Graphics Manager | `graphics/` | Perfis, escala, resolução dinâmica, FPS, VSync, térmico, baixo consumo |
| Save Manager | `save/` | Saves por jogo, exportar/importar ZIP, backups |
| Audio Manager | `audio/` | Foco de áudio, ducking, propriedades de saída, volumes |
| Settings | `settings/` | Preferências do app e mapeamento de gamepad |

## Documentação

- [docs/IMPORTING.md](docs/IMPORTING.md): como preparar e importar os jogos
- [docs/CONTROLS.md](docs/CONTROLS.md): criar controles, formato JSON e ZIP
- [docs/STATUS.md](docs/STATUS.md): o que está pronto, o que é experimental, o que depende do código do jogo
- [engine/src/main/cpp/backends/README.md](engine/src/main/cpp/backends/README.md): como plugar um backend real
- `samples/`: layouts JSON de exemplo e um pacote ZIP de controles
