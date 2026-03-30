# 12. Instalación del microcode (µcode)

Los fabricantes de procesadores como Intel y AMD publican con frecuencia actualizaciones de estabilidad y seguridad para el procesador. En Arch Linux están disponibles como paquetes oficiales y todo usuario debería instalarlos.

=== "Intel"

    ```bash
    pacman -S intel-ucode
    ```

=== "AMD"

    ```bash
    pacman -S amd-ucode
    ```

!!! note
    GRUB detectará e incluirá automáticamente el microcode en la configuración de arranque al ejecutar `grub-mkconfig`.
