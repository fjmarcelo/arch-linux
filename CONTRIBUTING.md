# Cómo contribuir

¡Gracias por tu interés en mejorar esta guía!

## Reportar un error o sugerir una mejora

1. Abre un [issue](https://github.com/fjmarcelo/arch-linux/issues) describiendo el problema o la mejora.
2. Incluye el número de paso afectado y, si es posible, una propuesta de corrección.

## Proponer un cambio directamente

1. Haz un fork del repositorio.
2. Crea una rama descriptiva: `git checkout -b mejora/verificacion-iso`.
3. Realiza los cambios en los ficheros `.md` (web) y/o `.tex` (PDF) correspondientes.
4. Abre un Pull Request explicando qué cambias y por qué.

## Estructura del repositorio

```
docs/          # Fuentes Markdown del sitio MkDocs
*.tex          # Fuentes LaTeX del PDF
master.sty     # Estilo LaTeX compartido
mkdocs.yml     # Configuración del sitio web
Makefile       # Compila el PDF (make pdf)
```

## Normas de estilo

- Los pasos siguen el formato infinitivo en los títulos de navegación (`Instalar el sistema base`).
- Los bloques de código llevan el lenguaje especificado (` ```bash `).
- Los avisos importantes usan admonitions (`!!! warning`, `!!! danger`, `!!! info`).
- Cada cambio técnico debe reflejarse tanto en el `.md` como en el `.tex` correspondiente.

## Licencia

Al contribuir, aceptas que tu aportación se distribuya bajo la misma licencia [CC BY-SA 4.0](LICENSE) que el resto del proyecto.
