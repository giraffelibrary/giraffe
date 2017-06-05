(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CValueVector(CElemType : C_VALUE_TYPE) :>
  MONO_VECTOR
    where type elem = CElemType.t
    where type vector = CElemType.v vector =
  struct
    type elem = CElemType.t
    type vector = CElemType.v vector
    val maxLen = Vector.maxLen
    val fromList = Vector.map CElemType.toC o Vector.fromList
    fun tabulate (n, f) = Vector.tabulate (n, CElemType.toC o f)
    val length = Vector.length
    val sub = CElemType.fromC o Vector.sub
    fun update (v, n, e) = Vector.update (v, n, CElemType.toC e)
    val concat = Vector.concat
    fun appi f v = Vector.appi (fn (i, e) => f (i, CElemType.fromC e)) v
    fun app f v = Vector.app (f o CElemType.fromC) v
    fun mapi f v =
      Vector.mapi (fn (i, e) => CElemType.toC (f (i, CElemType.fromC e))) v
    fun map f v = Vector.map (CElemType.toC o f o CElemType.fromC) v
    fun foldli f a v =
      Vector.foldli (fn (i, e, a) => f (i, CElemType.fromC e, a)) a v
    fun foldri f a v =
      Vector.foldri (fn (i, e, a) => f (i, CElemType.fromC e, a)) a v
    fun foldl f a v = Vector.foldl (fn (e, a) => f (CElemType.fromC e, a)) a v
    fun foldr f a v = Vector.foldr (fn (e, a) => f (CElemType.fromC e, a)) a v
    fun findi f v =
      case Vector.findi (fn (i, e) => f (i, CElemType.fromC e)) v of
        NONE        => NONE
      | SOME (i, e) => SOME (i, CElemType.fromC e)
    fun find f = Option.map CElemType.fromC o Vector.find (f o CElemType.fromC)
    fun exists f = Vector.exists (f o CElemType.fromC)
    fun all f = Vector.all (f o CElemType.fromC)
    fun collate f =
      Vector.collate (fn (e1, e2) => f (CElemType.fromC e1, CElemType.fromC e2))
  end
