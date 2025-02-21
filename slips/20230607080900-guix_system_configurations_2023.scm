:PROPERTIES:
:ID:       83315604-b917-45e3-9366-afe6ba029a60
:END:
#+TITLE: Systems Configuration with Guix
#+AUTHOR: David Conner
#+DESCRIPTION:
#+PROPERTY: header-args        :tangle-mode (identity #o444) :mkdirp yes
#+PROPERTY: header-args:sh     :tangle-mode (identity #o555) :mkdirp yes
#+PROPERTY: header-args:scheme :tangle-mode (identity #o644) :mkdirp yes :comments link
#+STARTUP: content
#+OPTIONS: toc:nil

* Table Of Contents :TOC_2_gh:
- [[#overview][Overview]]
- [[#systems][Systems]]
  - [[#machines][Machines]]
  - [[#usb-installation-image][USB Installation Image]]
  - [[#pgp-generation-image][PGP Generation Image]]
- [[#profile-management][Profile Management]]
  - [[#activating-profiles][Activating Profiles]]
  - [[#updating-profiles][Updating Profiles]]
  - [[#updating-channels][Updating Channels]]
- [[#dotfiles-management][Dotfiles Management]]
  - [[#syncing][Syncing]]
  - [[#updating][Updating]]
- [[#nix-package-manager][Nix Package Manager]]
- [[#system-installation][System Installation]]

* Overview

My naming system is based on morphemes featured in Benveniste's book [[https://www.amazon.com/Dictionary-Indo-European-Concepts-Society-Benveniste/dp/0986132594][Dictionary
of Indo-European Concepts & Society]] -- mainly as a hack to cross-study this
stuff ... so I can actually retain it?

**** TODO Channel Tasks
**** TODO Base System Tasks
- [ ] compile & use my own flavor of Zen Kernel
  + also port over other features from garuda
**** TODO add =base-channel.scm= so ./bin/update-channels works

* Systems

**** TODO see =loadkeys= and =/run/current-system/profile/share/keymaps= for more info on keyboards at cmdine

**** Install Notes:

+ =gdm-service-type= is removed and =elogind-service-type= is configured in
  =%dc-desktop-services= earlier. this alters the login & wm-selection behavior.
+ the =slim-service-type= along with the nested =xorg-configuration= is used
  instead of the GDM Display Manager.
  - find =xorg-configuration= in the Guix Docs
+ If additional window-managers are selected from the "Official Guix System"
  install, the packages for these are simply bundled in with:
  - =(append (list ...) %base-packages)=
  - i.e. i3, i3status, i3lock, dmenu, dunst, polybar would go here.
  - in these Dotfiles, the WM dependencies are bundled with the =desktop.scm= profile


** Machines

*** Config

+ emacs/default-face-size :: this is in 1/10pt

*** [[DPI/PPI Calculator][DPI/PPI Calculator]]

[[This webapp][This webapp]] will recalculate the DPI for a monitor from generic data available
to the browser. Moving the window to a new monitor will recalculate -- useful
for determining an average DPI across a heterogenous multi-monitor setup.

*** Per-System Settings

DW has also defined a function called =dw/system-settings-get= which can
retrieve these settings appropriately. This is used throughout =Desktop.org=.

#+begin_src emacs-lisp :tangle .emacs.d/per-system-settings.el :noweb yes

(require 'map) ;; Needed for map-merge

(setq dw/system-settings
  (map-merge
    'list
    `((desktop/dpi . 180)
      (desktop/background . ,(concat (or (getenv "$_WALLPAPERS") "/data/xdg/wallpapers/anime") "default.jpg"))
      (rofi/theme . "gruvbox-dark")
      (rofi/icons . "Papirus-Dark")
      (rofi/drun-theme . "gruvbox-dark")
      (rofi/drun-icons . "Papirus-Dark")
      (rofi/file-theme . "sidebar")
      (rofi/file-icons . "Papirus-Dark")
      (emacs/default-face-size . 100)
      (emacs/variable-face-size . 110)
      (emacs/fixed-face-size . 110)
      (emacs/doom-modeline-height . 21)
      (alacritty/shell-program . "/bin/bash")
      (i3/bar-type . "polybar.conf")
      (i3/shim . "guix.shim")
      (polybar/height . 35)
      (polybar/font-0-size . 18)
      (polybar/font-1-size . 14)
      (polybar/font-2-size . 20)
      (polybar/font-3-size . 13)
      (polybar/font-4-size . 18)
      (polybar/backlight-card . "intel_backlight")
      (dunst/font-size . 20)
      (dunst/max-icon-size . 88)

      ;; TODO: refactor this
      (dunst/icon-path . "/home/dc/.guix-extra-profiles/desktop/desktop/share/icons/gnome/32x32/status/:/home/dc/.guix-extra-profiles/desktop/desktop/share/icons/gnome/32x32/devices/:/home/dc/.guix-extra-profiles/desktop/desktop/share/icons/gnome/32x32/emblems/")
      (vimb/default-zoom . 180)
      (qutebrowser/default-zoom . 200)
      (xrandr/primary-display . "eDP"))
    <<system-settings>>))

#+end_src

+ Use =ls -1 /sys/class/backlight= to get the backlight

*** hersai

+ 2013 Macbook Pro :: [[file:.config/][.config/guix/systems/hersai.scm]]

*System Settings*

#+begin_src emacs-lisp :noweb-ref system-settings :noweb-sep ""

  (when (equal system-name "hersai")
    `((desktop/dpi . nil)
      (rofi/theme . "gruvbox-dark")
      (rofi/icons . "Papirus-Dark")
      (rofi/drun-theme . "gruvbox-dark")
      (rofi/drun-icons . "Papirus-Dark")
      (rofi/file-theme . "sidebar")
      (rofi/file-icons . "Papirus-Dark")
      ;(desktop/dpi . 221)
      (emacs/default-face-size . 120)
      (emacs/variable-face-size . 130)
      (emacs/fixed-face-size . 120)
      (emacs/doom-modeline-height . 17)
      (alacritty/shell-program . "/run/current-system/profile/bin/bash")
      (polybar/height . 48)
      (polybar/font-0-size . 24)
      (polybar/font-1-size . 18)
      (polybar/font-2-size . 27)
      (polybar/font-3-size . 13)
      (polybar/backlight-card . "intel_backlight")
      (dunst/font-size . 32)
      (dunst/max-icon-size . 88)
      (dunst/icon-path . "/home/dc/.guix-extra-profiles/desktop/desktop/share/icons/gnome/32x32/status/:/home/dc/.guix-extra-profiles/desktop/desktop/share/icons/gnome/32x32/devices/:/home/dc/.guix-extra-profiles/desktop/desktop/share/icons/gnome/32x32/emblems/")
      ;(vimb/default-zoom . 160)
      ;(qutebrowser/default-zoom . 180)
      (xrandr/primary-display . "eDP-1")
      ))

#+end_src

*** tokos

+ 2011 Macbook Pro :: [[file:.config/guix/systems/tokos.scm][.config/guix/systems/tokos.scm]]

#+begin_src emacs-lisp :noweb-ref system-settings :noweb-sep ""

  (when (equal system-name "tokos")
    `((desktop/dpi . 114)
      (rofi/theme . "gruvbox-dark")
      (rofi/icons . "Papirus-Dark")
      (rofi/drun-theme . "gruvbox-dark")
      (rofi/drun-icons . "Papirus-Dark")
      (rofi/file-theme . "sidebar")
      (rofi/file-icons . "Papirus-Dark")
      (emacs/default-face-size . 120)
      (emacs/variable-face-size . 130)
      (emacs/fixed-face-size . 120)
      (emacs/doom-modeline-height . 17)
      (alacritty/shell-program . "/run/current-system/profile/bin/bash")
      (polybar/height . 32)
      (polybar/font-0-size . 16)
      (polybar/font-1-size . 12)
      (polybar/font-2-size . 18)
      (polybar/font-3-size . 11)
      (polybar/backlight-card . "intel_backlight")
      (dunst/font-size . 20)
      (dunst/max-icon-size . 88)
      (dunst/icon-path . "/home/dc/.guix-extra-profiles/desktop/desktop/share/icons/gnome/32x32/status/:/home/dc/.guix-extra-profiles/desktop/desktop/share/icons/gnome/32x32/devices/:/home/dc/.guix-extra-profiles/desktop/desktop/share/icons/gnome/32x32/emblems/")
      ;(vimb/default-zoom . 160)
      ;(qutebrowser/default-zoom . 180)
      (xrandr/primary-display . "LVDS-1")
      ))

#+end_src

*** kharis

+ HP Elitebook

#+begin_src emacs-lisp :noweb-ref system-settings :noweb-sep ""

  (when (equal system-name "kharis")
    `((desktop/dpi . nil)
 	;;(desktop/dpi . 157) ;; TODO verify DPI
      (emacs/default-face-size . 90)
      (emacs/variable-face-size . 100)
      (emacs/fixed-face-size . 90)
      (emacs/doom-modeline-height . 17)
      (alacritty/shell-program . "/run/current-system/profile/bin/bash")
      (polybar/height . 32)
      (polybar/font-0-size . 14)
      (polybar/font-1-size . 12)
      (polybar/font-2-size . 18)
      (polybar/font-3-size . 8)
      (polybar/backlight-card . "amdgpu_bl0")
      (dunst/font-size . 16)
      (dunst/max-icon-size . 88)
      ;(vimb/default-zoom . 160)
      ;(qutebrowser/default-zoom . 180)
      (xrandr/primary-display . "eDP")))

#+end_src

*** kratos

+ Casual Desktop VM :: [[file:.config/guix/systems/tokos.scm][.config/guix/systems/tokos.scm]]

#+begin_src emacs-lisp :noweb-ref system-settings :noweb-sep ""

  (when (equal system-name "kratos")
    ;; when 4k monitor is running at 2560x1440
    '((desktop/dpi . 128)
      (emacs/default-face-size . 90)
      (emacs/variable-face-size . 110)
      (emacs/fixed-face-size . 90)
      (emacs/doom-modeline-height . 21)
      (i3/bar-type . "i3bar.conf")
      (i3/shim . "garuda.shim")
      (polybar/height . 48)
      (polybar/font-0-size . 24)
      (polybar/font-1-size . 18)
      (polybar/font-2-size . 27)
      (polybar/font-3-size . 13)
      (dunst/font-size . 18)
      (dunst/max-icon-size . 88)

      ;; TODO: refactor
      (dunst/icon-path "/usr/share/icons/Papirus-Dark/32x32/status/:/share/icons/Papirus-Dark/32x32/devices/:/usr/share/icons/Papirus-Dark/32x32/emblems/")
      ;(vimb/default-zoom . 160)
      ;(qutebrowser/default-zoom . 180)
      ))

#+end_src

*** kudos

+ VM running a large 4K display :: [[file:.config/guix/systems/kudos.scm][.config/guix/systems/kudos.scm]]

#+begin_src emacs-lisp :noweb-ref system-settings :noweb-sep ""

  (when (equal system-name "kudos")
    '((desktop/dpi . 158) ;; TODO verify DPI
      (emacs/default-face-size . 90)
      (emacs/variable-face-size . 100)
      (emacs/fixed-face-size . 90)
      (emacs/doom-modeline-height . 21)
      (polybar/height . 48)
      (polybar/font-0-size . 24)
      (polybar/font-1-size . 18)
      (polybar/font-2-size . 27)
      (polybar/font-3-size . 13)
      (dunst/font-size . 18)
      (dunst/max-icon-size . 88)
      ;(vimb/default-zoom . 160)
      ;(qutebrowser/default-zoom . 180)
      ))

#+end_src

*** peku

This term denotes livestock and thus:

+ Undifferentiated Generic VM :: [[file:.config/guix/systems/peku.scm][.config/guix/systems/peku.scm]]
  - This will be a TUI-only system. libsixel, maybe.
  - no per-system-settings.el

**** TODO assume profiles for these VMs to be copied from  =/etc/skel=
- use refer to =skeletons= in the guix manual

** USB Installation Image

** PGP Generation Image

* Profile Management

The guix packages on my system are separated into manifests. These can be
installed/updated inpedently (see [[https://github.com/daviwil/dotfiles/blob/master/Systems.org#profile-management][daviwil/dotfiles]]). The profiles get installed
under the =~/.guix-extra-profiles= path, which is sourced by =~/.profile= on
login, in addition to =~/.guix-profile=.

** Activating Profiles

This script accepts a space-separated list of manifest file names (without extension) under the =~/.config/guix/manifests= folder and then installs those profiles for the first time.  For example:

#+begin_example sh
activate-profiles desktop emacs music
#+end_example

+ [[file:bin/activate-profiles][bin/activate-profiles]]

** Updating Profiles

This script accepts a space-separated list of manifest file names (without extension) under the =~/.config/guix/manifests= folder and then installs any updates to the packages contained within them.  If no profile names are provided, it walks the list of profile directories under =~/.guix-extra-profiles= and updates each one of them.

#+begin_example sh
update-profiles emacs
#+end_example

+ [[file:bin/update-profiles][bin/update-profiles]]

** Updating Channels

This script makes it easy to update all channels to the latest commit based on an original channel file (see the Channels section at the top of this document).

+ [[file:bin/update-channels][bin/update-channels]]

* Dotfiles Management
** Syncing
** Updating

The script =update-dotfiles= requires running a script in Emacs
to loop over all of theliterate configuration =.org= files, running
=org-babel-tangle-file= to make sure all of the config files are up to date.

*.emacs.d/tangle-dotfiles.el*

#+begin_src emacs-lisp :tangle .emacs.d/tangle-dotfiles.el

  (require 'org)
  (load-file "~/.dotfiles/.emacs.d/lisp/dw-settings.el")

  ;; Don't ask when evaluating code blocks
  (setq org-confirm-babel-evaluate nil)

  ;; (let* ((dotfiles-path (expand-file-name "~/.dotfiles"))
  (let* ((dotfiles-path (expand-file-name "~/.dotfiles"))
	 (org-files (directory-files dotfiles-path nil "\\.org$")))

    (defun dw/tangle-org-file (org-file)
      (message "\n\033[1;32mUpdating %s\033[0m\n" org-file)
      (org-babel-tangle-file (expand-file-name org-file dotfiles-path)))

    ;; Tangle Systems.org first
    (dw/tangle-org-file "Systems.org")

    (dolist (org-file org-files)
      (if (member org-file '("Bash.org" "Desktop.org"))
	(dw/tangle-org-file org-file))))

#+end_src

* Nix Package Manager

* System Installation
