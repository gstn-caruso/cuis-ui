# Cuis UI Workspace

Workspace vivo para construir una nueva experiencia de IDE Morphic sobre Cuis Smalltalk.

## Características principales

- **Browser jerárquico**: panel con packages, clases y protocolos/métodos ordenados por jerarquía.
- **Editor especializado**: `IdeCodePaneMorph` envuelve a `SmalltalkEditor` con gutter propio, resaltado temático y overlay de quick actions.
- **Quick actions**: `IdeQuickActionController` coordina providers (p. ej. toggles de breakpoints) y muestra la lamparita contextual.
- **Breakpoints de método**: integración con `BreakingMethodWrapper` para activar/desactivar desde el popup.
- **Suite automática**: 35 tests cubren modelo, ventana, providers y full UI wiring (`CuisUI-IDE-Tests`).

## Requisitos

- Cuis Smalltalk 7.7 (update `#7777` o superior) corriendo desde `Cuis-Smalltalk-Dev`.
- Un clon de este repo en tu filesystem local.
- Herramientas MCP (`cuis-mcp`) si querés editar desde la línea de comandos.

## Inicio rápido

1. **Cloná** este repo junto a tu checkout de Cuis.
2. **Abrí** tu imagen Cuis y desde un `File List` fileIn el script `scripts/install-cuis-ui-packages.st`.
   - El script te pide el directorio del repo y luego instala `Core`, `Browser` y `Tests` usando `CodePackageFile installPackage:`.
3. **Arrancá** la ventana con `IdeBrowserWindow open` (evaluá el snippet en un Workspace o vía MCP `eval`).
4. **Explorá** los paneles: packages -> clases -> protocolos/métodos y el editor inferior con gutter, línea activa y lamparita.

El script vive en `scripts/install-cuis-ui-packages.st` para volver a instalar los packages cuando sincronices el repo.

## Estructura del repo

- `CuisUI-IDE-Core.pck.st`: morphs del editor, tema, overlay, gutter y controladores de quick actions.
- `CuisUI-IDE-Browser.pck.st`: `IdeBrowserModel`, `IdeBrowserWindow` y wrappers de árbol/lista.
- `CuisUI-IDE-Tests.pck.st`: suite automatizada con doubles (`IdeFakeKeyboardEvent`, `IdeFakeQuickActionProvider`, etc.).
- `scripts/install-cuis-ui-packages.st`: script interactivo para instalar los packages desde una imagen limpia.
- `SETUP.md`: checklist operativo y tips para trabajar con UIs en Cuis.
- `docs/IDE-MVP-ARCHITECTURE.md`: decisión arquitectónica y alcance del MVP.

## Flujo de trabajo recomendado

1. Editá y prototipá **dentro de la imagen** (Browser, Workspace o herramientas MCP).
2. Ejecutá los tests:

   ```smalltalk
   #(IdeBrowserModelTest IdeBrowserWindowTest IdeMethodBreakpointActionProviderTest
     IdeQuickActionContextTest IdeQuickActionControllerTest IdeQuickActionTest)
     do: [:each | (TestSuite forTestCaseClass: (Smalltalk at: each)) run ].
   ```

3. Guardá los packages antes de volver a git:

   ```smalltalk
   (CodePackage installedPackages at: 'CuisUI-IDE-Core') save.
   (CodePackage installedPackages at: 'CuisUI-IDE-Browser') save.
   (CodePackage installedPackages at: 'CuisUI-IDE-Tests') save.
   ```

4. Versioná los `.pck.st` resultantes.

## Documentación útil

- [`SETUP.md`](SETUP.md): rutina diaria para validar la imagen y prototipar morphs.
- [`docs/IDE-MVP-ARCHITECTURE.md`](docs/IDE-MVP-ARCHITECTURE.md): desapila objetivos, componentes y roadmap.
- [`docs/GETTING_STARTED.md`](docs/GETTING_STARTED.md): guía paso a paso para preparar la imagen, correr el script de instalación y publicar cambios.

## Checkpoint de referencia

- Commit base estable: `98e950c`.
- `IdeBrowserWindow open` muestra el browser sin íconos pero con los tres paneles funcionales.
- La suite completa (`CuisUI-IDE-Tests`) reporta `35` tests verdes.
