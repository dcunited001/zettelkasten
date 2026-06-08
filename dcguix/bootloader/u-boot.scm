;; [[file:../../../../org/roam/dcguix/bootloader/u-boot.org::*=(ellipsis packages bootloaders)=][=(ellipsis packages bootloaders)=:1]]
(define-module (ellipsis bootloader u-boot)
  #:use-module (gnu bootloader u-boot)
  #:use-module (gnu bootloader extlinux)
  #:use-module (gnu bootloader)
  #:use-module (gnu packages bootloaders)
  #:use-module (guix gexp)
  #:use-module (ice-9 match)

  #:export (ellipsis-bootloader-foo))

;; NOTE: assume that the code in here does NOT work. i'll be sure to update
;; here when it does with whatever caveats i have in mind.

(define ellipsis-bootloaders-foo "foo")

;; only 3328 and 3399 are mentioned in ./gnu/bootloader/u-boot.scm
;; 
;; https://codeberg.org/guix/guix.git/src/branch/master/gnu/bootloader/u-boot.scm#L1

;; (define install-rockchip-u-boot
;;   (write-u-boot-image '(("idbloader.img" 64) ("u-boot.itb" 16384)) 512))

;; (define u-boot-rockchip-bootloader
;;   ;; SD and eMMC use the same format
;;   (bootloader
;;    (inherit u-boot-bootloader)
;;    (disk-image-installer install-rockchip-u-boot)))

(define u-boot-rock64-rk3588-bootloader
  (bootloader
    (inherit u-boot-rockchip-bootloader)
    (package u-boot-rock64-rk3588)))
;; =(ellipsis packages bootloaders)=:1 ends here
