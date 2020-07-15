(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ListSequence :> SEQUENCE where type 'a t = 'a list =
  struct
    open List

    fun splitAt (n, xs) =
      let
        fun aux n (ys, xs) =
          if n > 0
          then
            case xs of
              x :: xs => aux (n - 1) (x :: ys, xs)
            | []      => raise Subscript
          else if n = 0
          then (ys, xs)
          else raise Subscript
      in
        aux n ([], xs)
      end

    type 'a t = 'a list
    val sub = nth
    fun get xs i = sub (xs, i)
    fun update (xs, i, x) =
      case splitAt (i, xs) of
        (ys, _ :: xs) => List.revAppend (ys, x :: xs)
      | _             => raise Subscript
    fun set xs (i, x) = update (xs, i, x)
    fun appi f =
      let
        fun step n xs =
          case xs of
            [] => ()
          | x :: xs => (f (n, x); step (n + 1) xs)
      in
        step 0
      end
    val fromList = Fn.id
    val toList = Fn.id
    val toVector = Vector.fromList
    fun fromVector v =
      List.tabulate (Vector.length v, fn i => Vector.sub (v, i))
  end
