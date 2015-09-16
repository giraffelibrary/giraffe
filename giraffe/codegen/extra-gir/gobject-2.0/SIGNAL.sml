(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature SIGNAL =
  sig
    type 'object_class signal

    type 'a marshaller
    type 'a object_class_t

    val signal
      : string
         -> ('a -> 'b) marshaller
         -> ('a -> 'b) -> 'c object_class_t signal

    type signal_id
    val connect :
      'a object_class_t
       -> ('func -> 'a object_class_t signal)
       -> 'func
       -> signal_id
    val connectAfter :
      'a object_class_t
       -> ('func -> 'a object_class_t signal)
       -> 'func
       -> signal_id
    val disconnect : 'a object_class_t -> signal_id -> unit
    val isConnected : 'a object_class_t -> signal_id -> bool
  end
