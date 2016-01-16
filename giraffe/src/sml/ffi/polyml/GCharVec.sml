(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GCharVec :>
  sig
    include
      C_ARRAY
        where type elem = char
        where type vector = string

    structure PolyML :
      sig
        val OUTPTR : 'a C.out_p PolyMLFFI.conversion
        val INPTR : 'a C.in_p PolyMLFFI.conversion
        val INOUTREF : ('a, 'b) C.r PolyMLFFI.conversion
      end
  end =
  struct
    (**
     * For Poly/ML, `t`, the representation of a C string, is always
     * just a pointer to a null terminated string.  Although conversion from
     * an SML string will, therefore, allocate a copy of the string on the
     * C heap, this would have happened anyway before the SML string was
     * passed to a C function.  Furthermore, by doing the allocation on
     * conversion from an SML string, multiple copies of the same string on
     * the C heap can be avoided by using the same `t` value.
     *)
    type t = CPointer.notnull CPointer.t Finalizable.t

    type vector = string
    type elem = char

    structure C =
      struct
        structure Pointer = CPointer
        type 'a p = 'a Pointer.t
        type notnull = Pointer.notnull

        local
          open PolyMLFFI
          open Pointer
          open PolyML
        in
          val g_malloc_sym = getSymbol libglib "g_malloc"
          val g_strdup_sym = getSymbol libglib "g_strdup"
          val g_free_sym = getSymbol libglib "g_free"
          val strlen_sym = getSymbol libc "strlen"

          val malloc_ : int -> notnull t = call g_malloc_sym (cUlong --> cVal)
          val dup_ : notnull t -> notnull t =
            fn p => call g_strdup_sym (cVal --> cVal) p
          val free_ : notnull t -> unit = call g_free_sym (cVal --> cVoid)
          val len_ : notnull t -> int = call strlen_sym (cVal --> cInt)
          val sub_ : notnull t * int -> char =
            Byte.byteToChar o Pointer.getWord8

          val size_ = Word.toInt size
        end

        fun new n = malloc_ (n * size_)
        val free = free_
        val dup = dup_
        val len = len_
        fun sub p i = sub_ (p, i)

        type 'a tabulator = int * (int -> elem) -> 'a


        (**
         * Return values
         *)

        structure OutPointer = Pointer
        type 'a out_p = 'a p

        fun fromPtr (p : notnull out_p) : t = Finalizable.new p

        fun fromNewPtr (p : notnull out_p) : t =
          let
            val t = Finalizable.new p
          in
            Finalizable.addFinalizer (t, free);
            t
          end

        fun copyPtr (p : notnull out_p) : t =
          fromNewPtr (dup p)

        fun copyNewPtr (p : notnull out_p) : t =
          copyPtr p before free p

        fun copyPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          tabulate (len p, sub p)

        fun copyNewPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          copyPtrToTabulated tabulate p before free p

        fun copyPtrToVector (p : notnull out_p) : vector =
          CharVector.tabulate (len p, sub p)

        fun copyNewPtrToVector (p : notnull out_p) : vector =
          copyPtrToVector p before free p


        fun fromOptPtr (p : 'a out_p) : t option =
          Option.map fromPtr (Pointer.toOpt p)

        fun fromNewOptPtr (p : 'a out_p) : t option =
          Option.map fromNewPtr (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

        fun copyOptPtr (p : 'a out_p) : t option =
          Option.map copyPtr (Pointer.toOpt p)

        fun copyNewOptPtr (p : 'a out_p) : t option =
          Option.map copyNewPtr (Pointer.toOpt p)

        fun copyOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyNewOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyNewPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyPtrToVector (Pointer.toOpt p)

        fun copyNewOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyNewPtrToVector (Pointer.toOpt p)


        fun fromVector v =
          let
            val n = CharVector.length v
            val p = new (n + 1)
            fun set (i, c) = Pointer.setWord8 (p, i, Byte.charToByte c)
            val () = CharVector.appi set v
            val () = Pointer.setWord8 (p, n, 0w0)
          in
            p
          end


        (**
         * Value parameters
         *)
        type 'a in_p = unit p

        local
          fun fromPointer (p : 'a p) : 'b in_p = Pointer.toOptNull p

          fun withPointer f p = f (fromPointer p)

          fun withDupPointer f p =
            p & withPointer f p handle e => (Pointer.appOpt free p; raise e)
        in
          fun withPtr f t = Finalizable.withValue (t, withPointer f)

          val withConstPtr = withPtr

          fun withDupPtr f t =
            Finalizable.withValue (t, withDupPointer f o dup)


          fun withOptPtr f =
            fn
              SOME t => Finalizable.withValue (t, withPointer f)
            | NONE   => withPointer f Pointer.null

          val withConstOptPtr = withOptPtr

          (* `withDupOptPtr` handles null pointer explicitly to avoid
           * call to `dup` with a null pointer. *)
          fun withDupOptPtr f =
            fn
              SOME t =>
                Finalizable.withValue
                  (t, withDupPointer f o Pointer.toOptNull o dup)
            | NONE   => withDupPointer f Pointer.null
        end


        (**
         * Reference parameters
         *)
        type ('a, 'b) r = Pointer.PolyML.ref_

        local
          val null = Pointer.PolyML.nullRef

          fun withRefPointer f p = Pointer.PolyML.withRef f p

          fun withRefDupPointer f p =
            withRefPointer f p handle e => (Pointer.appOpt free p; raise e)
        in
          fun withNullRef f () = f null


          fun withRefPtr f t = Finalizable.withValue (t, withRefPointer f)

          val withRefConstPtr = withRefPtr

          fun withRefDupPtr f t =
            Finalizable.withValue (t, withRefDupPointer f o dup)


          fun withRefOptPtr f =
            fn
              SOME t => Finalizable.withValue (t, withRefPointer f)
            | NONE   => withRefPointer f Pointer.null

          val withRefConstOptPtr = withRefOptPtr

          (* `withRefDupOptPtr` handles null pointer explicitly to avoid
           * call to `dup` with a null pointer. *)
          fun withRefDupOptPtr f =
            fn
              SOME t =>
                Finalizable.withValue (t, withRefDupPointer f o dup)
            | NONE   => withRefDupPointer f Pointer.null
        end
      end

    type vector = string

    fun fromVector v = C.fromNewPtr (C.fromVector v)

    fun toVector t = Finalizable.withValue (t, C.copyPtrToVector)

    fun length t = Finalizable.withValue (t, C.len)

    fun sub t =
      let
        val len = length t
        val sub = Finalizable.withValue (t, C.sub)
      in
        fn i =>
          if 0 <= i andalso i < len
          then sub i
          else raise Subscript
      end


    structure PolyML =
      struct
        val OUTPTR : 'a C.out_p PolyMLFFI.conversion = C.Pointer.PolyML.cVal
        val INPTR : 'a C.in_p PolyMLFFI.conversion = C.Pointer.PolyML.cVal
        val INOUTREF : ('a, 'b) C.r PolyMLFFI.conversion = C.Pointer.PolyML.cRef
      end
  end
