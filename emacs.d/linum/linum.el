;;; linum.el --- Display line numbers to the left of buffers

;; Copyright (C) 2007, 2008  Markus Triska

;; Author: Markus Triska <markus.triska@gmx.at>
;; Keywords: convenience

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; Display line numbers for the current buffer. Copy linum.el to your
;; load-path and add to your .emacs:

;;    (require 'linum)

;; Then toggle display of line numbers with M-x linum-mode. To enable
;; line numbering in all buffers, use M-x global-linum-mode.

;;; Code:

(defconst linum-version "0.9wza")

(defvar linum-overlays nil "Overlays used in this buffer.")
(defvar linum-available nil "Overlays available for reuse.")
(defvar linum-before-numbering-hook nil
  "Functions run in each buffer before line numbering starts.")

(mapc #'make-variable-buffer-local '(linum-overlays linum-available))

(defgroup linum nil
  "Show line numbers to the left of buffers"
  :group 'convenience)

;;;###autoload
(defcustom linum-format 'dynamic
  "Format used to display line numbers. Either a format string
like \"%7d\", 'dynamic to adapt the width as needed, or a
function that is called with a line number as its argument and
should evaluate to a string to be shown on that line. See also
`linum-before-numbering-hook'."
  :group 'linum
  :type 'sexp)

(defface linum
  '((t :inherit (shadow default)))
  "Face for displaying line numbers in the display margin."
  :group 'linum)

(defcustom linum-eager t
  "Whether line numbers should be updated after each command.
The conservative setting `nil' might miss some buffer changes,
and you have to scroll or press C-l to update the numbers."
  :group 'linum
  :type 'boolean)

(defcustom linum-delay nil
  "Delay updates to give Emacs a chance for other changes."
  :group 'linum
  :type 'boolean)

;;;###autoload
(define-minor-mode linum-mode
  "Toggle display of line 
