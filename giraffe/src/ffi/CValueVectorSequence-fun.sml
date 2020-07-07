(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CValueVectorSequence(CElemType : C_VALUE_TYPE) :>
  MONO_SEQUENCE
    where type t = CElemType.t vector
    where type elem = CElemType.t =
  struct
    type t = CElemType.t vector
    type elem = CElemType.t
    val tabulate = Vector.tabulate
    fun get v i = Vector.sub (v, i)
    val sub = Vector.sub
    val length = Vector.length
    val appi = Vector.appi
    val fromList = Vector.fromList
    fun toList v = List.tabulate (length v, get v)
    val toVector = Vector.map CElemType.toC
    val fromVector = Vector.map CElemType.fromC
    structure Vector = CValueVector(CElemType)
  end
