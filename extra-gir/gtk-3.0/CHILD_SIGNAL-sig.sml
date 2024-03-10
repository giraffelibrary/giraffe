(* Copyright (C) 2012, 2017, 2021, 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CHILD_SIGNAL =
  sig
    type 'a widget_class

    val connect :
      'a widget_class
       -> 'b GObject.ObjectClass.class
       -> ('b GObject.ObjectClass.class, 'c, 'arg_h, 'res_h, 'd) Signal.t
           * ('b GObject.ObjectClass.class -> 'arg_h -> 'res_h)
       -> unit
    val connectAfter :
      'a widget_class
       -> 'b GObject.ObjectClass.class
       -> ('b GObject.ObjectClass.class, 'c, 'arg_h, 'res_h, 'd) Signal.t
           * ('b GObject.ObjectClass.class -> 'arg_h -> 'res_h)
       -> unit
  end
