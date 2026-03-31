# 16. Entornos gráficos

Antes de instalar un escritorio hay que asegurarse de que los drivers de vídeo están correctamente instalados. Es uno de los puntos donde más alumnos se atascan.

---

## Identificar la tarjeta gráfica

```bash
lspci | grep -i vga
```

## Instalar los drivers de vídeo

=== "Intel / AMD (Mesa)"

    ```bash
    yay -S mesa
    ```

    Mesa proporciona soporte OpenGL y Vulkan para Intel y AMD. Es la opción por defecto
    y la recomendada para Wayland.

=== "NVIDIA (propietario)"

    ```bash
    yay -S nvidia nvidia-utils
    ```

    Para kernels LTS usa `nvidia-lts`. Consulta la
    [wiki de Arch sobre NVIDIA](https://wiki.archlinux.org/title/NVIDIA_(Español))
    si el hardware es muy nuevo o antiguo.

=== "NVIDIA (open-source)"

    ```bash
    yay -S nvidia-open nvidia-utils
    ```

    Disponible desde la serie RTX 2000. Rendimiento comparable al propietario
    con la ventaja del código abierto.

=== "Hardware antiguo / genérico"

    ```bash
    yay -S xf86-video-vesa
    ```

!!! tip "¿Cuál elijo?"
    Intel → `mesa`. AMD → `mesa`. NVIDIA moderna → `nvidia` o `nvidia-open`. En caso de duda, `mesa` funciona para la mayoría del hardware integrado.

---

## Entornos de escritorio

=== "GNOME"

    ```bash
    yay -S gnome gdm
    systemctl enable gdm
    ```

    Entorno completo y moderno con excelente soporte Wayland. `gdm` es su display manager nativo.

=== "KDE Plasma"

    ```bash
    yay -S plasma sddm
    systemctl enable sddm
    ```

    Altamente configurable. `sddm` es el display manager recomendado por KDE.

=== "XFCE"

    ```bash
    yay -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
    systemctl enable lightdm
    ```

    Opción ligera e ideal para hardware con pocos recursos. Consume sensiblemente menos RAM que GNOME o KDE.

---

## Compositores Wayland (caso avanzado)

Si prefieres un entorno minimalista y moderno basado en Wayland en lugar de un escritorio completo:

=== "Hyprland"

    ```bash
    yay -S hyprland waybar wofi kitty
    ```

    Tiling compositor Wayland muy popular por su configurabilidad y efectos visuales.
    Se inicia desde la TTY con `Hyprland`.

=== "Sway"

    ```bash
    yay -S sway swaybar dmenu foot
    ```

    Equivalente Wayland de i3. Más estable y conservador que Hyprland.
    Se inicia desde la TTY con `sway`.

!!! note "Sin display manager"
    Los compositores Wayland suelen iniciarse directamente desde la TTY, sin necesidad de GDM, SDDM ni LightDM.

---

## Reinicio y verificación

Una vez habilitado el entorno gráfico, salimos del chroot y reiniciamos:

```bash
exit          # salir del chroot
umount -R /mnt
reboot
```

!!! info "Resultado esperado"
    Al arrancar deberías ver la pantalla de login del display manager (GDM, SDDM o LightDM).
    Si el sistema arranca en TTY en lugar del entorno gráfico, comprueba que el servicio está habilitado:

    ```bash
    systemctl status gdm   # o sddm, lightdm
    ```

!!! tip "Wiki oficial"
    En caso de dudas, consulta la [wiki de Arch Linux en español](https://wiki.archlinux.org/title/Main_page_(Español)).
