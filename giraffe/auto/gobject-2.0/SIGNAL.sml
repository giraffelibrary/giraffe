(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature SIGNAL =
  sig
    type 'objectclass signal

    type 'a marshaller
    type 'a objectclass_t

    val signal
      : string
         -> ('a -> 'b) marshaller
         -> ('a -> 'b) -> 'c objectclass_t signal

    type signal_id
    val connect :
      'a objectclass_t
       -> ('func -> 'a objectclass_t signal)
       -> 'func
       -> signal_id
    val connectAfter :
      'a objectclass_t
       -> ('func -> 'a objectclass_t signal)
       -> 'func
       -> signal_id
    val disconnect : 'a objectclass_t -> signal_id -> unit
    val isConnected : 'a objectclass_t -> signal_id -> bool
  end
