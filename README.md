# Instalación de Arch Linux

Guía completa para la instalación de Arch Linux paso a paso, desde la descarga de la ISO hasta la configuración de un entorno gráfico.

## Contenido

- Descarga y verificación de la ISO (SHA256 + GPG)
- Configuración de teclado, red y modo de arranque
- Particionado con `cfdisk` (BIOS/UEFI, MBR/GPT)
- Optimización de mirrors con `reflector`
- Instalación del sistema base con `pacstrap`
- Configuración del sistema (zona horaria, localización, red, usuarios, microcode, GRUB)
- Repositorio AUR y gestor `yay`
- Drivers de vídeo e instalación de entornos gráficos (GNOME, KDE, XFCE, Hyprland, Sway)

## Formatos disponibles

- **Web**: <https://fjmarcelo.github.io/arch-linux/>
- **PDF**: descargable desde la página de inicio del sitio web

## Compilar el PDF

```bash
make pdf
```

Requiere `xelatex` y las fuentes Calibri y FiraCode instaladas.

## Contribuir

Consulta [CONTRIBUTING.md](CONTRIBUTING.md) para saber cómo reportar errores o proponer mejoras.

## Licencia

Este contenido se distribuye bajo la licencia [Creative Commons BY-SA 4.0](LICENSE).
