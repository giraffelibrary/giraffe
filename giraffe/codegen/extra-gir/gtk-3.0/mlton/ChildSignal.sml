(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ChildSignal :>
  CHILD_SIGNAL
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    type 'a widget_class_t = 'a GtkWidgetClass.t

    fun connect parent object signal f =
      let
        val id = Signal.connect object signal f
      in
        Signal.connect
          parent
          GtkWidget.destroySig
          (fn () => Signal.disconnect object id);
        ()
      end

    fun connectAfter parent object signal f =
      let
        val id = Signal.connect object signal f
      in
        Signal.connectAfter
          parent
          GtkWidget.destroySig
          (fn () => Signal.disconnect object id);
        ()
      end
  end
