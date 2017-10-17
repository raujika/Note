(require :lunette)
(defpackage :Lun
  (:use #:common-lisp
        #:cffi
        #:cffi-sys
        #:Lunette)
	(:export #:WinMain))
(in-package :Lun)

(load-foreign-library "gdi32.dll")
(load-foreign-library "Comctl32.dll")
(load-foreign-library "Comdlg32.dll")
(use-package :Lunette.Graphics)
(use-package :Lunette.Controls)
(use-package :Lunette.Controls.Calendar)
(use-package :Lunette.Controls.Edit)
(use-package :Lunette.Controls.Header)
(use-package :Lunette.Controls.ListBox)
(use-package :Lunette.Controls.ProgressBar)
(use-package :Lunette.Controls.PropertySheets)
(use-package :Lunette.Controls.Scrollbar)
(use-package :Lunette.Controls.Spin)
(use-package :Lunette.Controls.Static)
(use-package :Lunette.Controls.StatusBar)
(use-package :Lunette.Controls.Toolbar)
(use-package :Lunette.Controls.Tab)
(use-package :Lunette.Controls.Trackbar)
(use-package :Lunette.Controls.TreeView)
;(use-package :Lunette.Dialogs)
(use-package :Lunette.Dialogs.FileName)
;(use-package :Lunette.Dialogs.MessageBox)
;Lunette.Dialogs:
;Lunette.Dialogs.MessageBox:
(use-package :Lunette.Errors)
(use-package :Lunette.Files)
(use-package :Lunette.Graphics.Text)
(use-package :Lunette.Memory)
(use-package :Lunette.Messages)
(use-package :Lunette.Resources)
(use-package :Lunette.System)
(use-package :Lunette.VirtualKeys)
(use-package :Lunette.Controls.Button)
(use-package :Lunette.Windows)

(defcallback WindowFunc LRESULT ((hWnd HWND)
                                 (msg :UINT)
                                 (wparam WPARAM)
                                 (lparam LPARAM))
  (cond
    ((eql msg WM_DESTROY)
     (PostQuitMessage 0)
     0)
    ((eql msg WM_CHAR)
     (let ((msg (format nil "Character is ~A~%" (code-char wparam))))
       (Lunette.Dialogs.MessageBox:message-box hwnd "WM_CHAR Received" msg)))
    (t (DefWindowProc hwnd msg wparam lparam))))

(defun WinMain ()
  (setf *default-foreign-encoding* :utf-16le)

  (register-class "WmCharWin" :lpfnWndProc (callback WindowFunc))

  (let ((hwnd (create-window-ex "WmCharWin" "WM_CHAR Window")))
    (ShowWindow hwnd SW_SHOW)
    (ShowWindow hwnd SW_SHOW)
    (UpdateWindow hwnd)

    (with-foreign-object (msg 'MSG)
      (loop with result
           while (not (= 0 (setf result (GetMessage MSG (null-pointer) 0 0))))
           do (progn
                (TranslateMessage msg)
                (DispatchMessage msg)))
      (foreign-slot-value msg 'MSG 'wParam))))

;(in-package :Lun)
;(winmain)