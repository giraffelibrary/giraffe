(* Copyright (C) 2012, 2021, 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ChildSignal :>
  CHILD_SIGNAL
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    type 'a widget_class = 'a GtkWidgetClass.class

    fun connect parent object (signal, f) =
      let
        val id = Signal.connect object (signal, f)
        val _ =
          Signal.connect
            parent
            (GtkWidget.destroySig, fn _ => Signal.handlerDisconnect object id)
      in
        ()
      end

    fun connectAfter parent object (signal, f) =
      let
        val id = Signal.connectAfter object (signal, f)
        val _ =
          Signal.connect
            parent
            (GtkWidget.destroySig, fn _ => Signal.handlerDisconnect object id)
      in
        ()
      end
  end
