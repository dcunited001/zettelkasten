;; [[file:sourcetrail.org::*Package][Package:1]]
(use-modules (guix utils)
             ((guix licenses) #:prefix license:)
             (guix packages)
             (guix git-download)
             (guix build-system cmake)
             (gnu)
             (gnu packages)
             (srfi srfi-1))

;; maven openjdk-23-jdk (21.0...)
(use-package-modules ninja boost qt sqlite xml check pkg-config)

(define sourcetrails
  (let ((commit "59503c7449e9557fa43490f2fa8a0183d05480a2")
        (version "2025.4.1"))
    (package
      (name "sourcetrails")
      (version version)
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/petermost/sourcetrail")
           (commit version)))
         (file-name (git-file-name name version))
         (sha256 (base32 "0igjzkq9v6np91vhnbb07kbmfz9s2yy26ah9l2q4l9j167pbjiih"))
         ;; modules?
         ;; snippet?
         )))
    (build-system cmake-build-system)
    ;; pkg-config necessary?
    (native-inputs
     (list pkg-config ninja catch2 googletest))
    (inputs (list boost qtbase qtsvg sqlite tinyxml))
    (home-page "https://github.com/petermost/sourcetrail")
    (synopsis
     "Sourcetrail is a free and open-source interactive source explorer.")
    (description
     "Sourcetrail is a free and open-source cross-platform source explorer that
 helps you get productive on unfamiliar source code. It offers an SDK to write
 custom language extensions.")
    (license license:gpl3)))
;; Package:1 ends here
