(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GtkActionEntry :> GTK_ACTION_ENTRY =
  struct
    type t =
      {
        name : string,
        stockId : string option,
        label : string option,
        accelerator : string option,
        tooltip : string option,
        callback : (unit -> unit) option
      }
  end
