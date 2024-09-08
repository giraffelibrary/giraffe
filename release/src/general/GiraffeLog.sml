(* Copyright (C) 2012, 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GiraffeLog :> GIRAFFE_LOG =
  struct
    fun log (uc : bool) (msgType : string list) : string list -> unit =
      let
        val msgPrefix'1 =
          String.concat ["[", String.concatWith "-" ("giraffe" :: msgType), "]"]
        val msgPrefix =
          if uc
          then String.map Char.toUpper msgPrefix'1
          else msgPrefix'1
      in
        fn fields => print (String.concat (msgPrefix :: fields))
      end

    fun logDebug msgType = log false ("debug" :: msgType)
    val logWarning = log false ["warning"]
    val logCritical = log true ["critical"]

    fun warning msg = logWarning [" ", msg, "\n"]
    fun critical msg = logCritical [" ", msg, "\n"]
  end
