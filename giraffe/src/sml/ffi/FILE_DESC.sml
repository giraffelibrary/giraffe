(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature FILE_DESC =
  sig
    type t = Posix.ProcEnv.file_desc

    val null : t

    structure C :
      sig
        type val_
        type ref_
        val withVal : (val_ -> 'a) -> t -> 'a
        val withRefVal : (ref_ -> 'a) -> t -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
