# 16. Entornos gráficos

Con `yay` disponible, instalar un escritorio es muy sencillo.

=== "GNOME"

    ```bash
    yay -S gnome gdm
    systemctl enable gdm
    ```

=== "KDE Plasma"

    ```bash
    yay -S plasma sddm
    systemctl enable sddm
    ```

!!! note
    Puedes instalar cualquier otro entorno de escritorio disponible en los repositorios de
    la misma manera: XFCE, MATE, Cinnamon, i3, Hyprland, etc.

---

Con esto podemos dar por terminada la instalación de Arch Linux.

!!! tip "Wiki oficial"
    En caso de dudas, consulta la [wiki de Arch Linux en español](https://wiki.archlinux.org/title/Main_page_(Español)).
