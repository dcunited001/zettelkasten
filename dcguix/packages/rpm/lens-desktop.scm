(define-module (dcguix packages rpm lens-desktop)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)

  #:use-module (nonguix build-system binary)
  #:use-module (nonguix build-system chromium-binary)

  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages golang)

  #:use-module (gnu packages tls)
  #:use-module (gnu packages security-token)
  ;; #:use-module (gnu packages gcc)

  #:use-module (gnu packages cpio)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages package-management)
  #:use-module (srfi srfi-1))

(define-public lens-desktop
  (package
    (name "lens-desktop")
    (version "2024.4.230844")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://downloads.k8slens.dev/apt/debian/pool/stable/main/Lens-2024.4.230844-latest_amd64.deb"))
              (sha256
               (base32 "062ac44svwhvqac17gm43yc7hv38k4pcqfrw9pd25p55ykax283h"))))
    ;; maybe chromium build system (which wraps binary-build-system & is used for electron)
    (build-system chromium-binary-build-system)

    (arguments
     (list
      ;; #:validate-runpath? #f
      )))
    (home-page "")
    (synopsis "")
    (description "")
    ;; umm that's literally what the github says
    (license license:expat)))
