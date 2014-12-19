(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Combinators =
  struct
    fun I x = x
    fun K x _ = x
    fun S f g x = f x (g x)

    fun $ x f = f x
  end

open Combinators
