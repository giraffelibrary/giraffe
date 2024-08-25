(* Copyright (C) 2017-2020, 2023-2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor Class(
  structure Pointer : C_POINTER
  type opt = Pointer.opt
  type non_opt = Pointer.non_opt
  type 'a p = 'a Pointer.p
  type 'a value_accessor_t
  val take_ : non_opt p -> unit
  val dup_ : non_opt p -> non_opt p
  val free_ : non_opt p -> unit
  val checkInstance_ : 'a value_accessor_t -> non_opt p -> unit
  val instanceTypeName_ : non_opt p -> string
) :>
  CLASS
    where type C.Pointer.opt = Pointer.opt
    where type C.Pointer.non_opt = Pointer.non_opt
    where type 'a C.Pointer.p = 'a Pointer.p
    where type ('a, 'b) C.Pointer.r = ('a, 'b) Pointer.r
    where type 'a value_accessor_t = 'a value_accessor_t =
  struct
    type 'a class = non_opt p ThreadFinalizable.t
    type t = base class
    type 'a value_accessor_t = 'a value_accessor_t

    fun logEnabled () = GiraffeDebug.logMemEnabled ()
    fun log (memOp, p) =
      GiraffeDebug.logMem
        {
          memOp    = memOp,
          instKind = "object",
          instType = instanceTypeName_ p,
          instAddr = Pointer.toString p
        }

    val take_ =
      fn p => (
        if logEnabled () then log (GiraffeDebug.MTake, p) else ();
        take_ p
      )

    val dup_ =
      fn p => (
        if logEnabled () then log (GiraffeDebug.MDup, p) else ();
        dup_ p
      )

    val free_ =
      fn p => (
        if logEnabled () then log (GiraffeDebug.MFree, p) else ();
        free_ p
      )

    structure C =
      struct
        structure Pointer = Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p

        type 'a from_p = 'a

        structure PointerType =
          struct
            structure Pointer = Pointer
            type opt = Pointer.opt
            type non_opt = Pointer.non_opt
            type 'a p = 'a Pointer.p

            type t = non_opt p ThreadFinalizable.t

            type 'a from_p = 'a from_p

            fun dup d = if d <> 0 then dup_ else Fn.id

            fun free d = if d <> 0 then free_ else ignore

            fun toC t = (* giveDupPtr Fn.id t *)
              ThreadFinalizable.withValue (t, Pointer.withVal dup_)

            fun fromC ptr =
              let
                val t = ThreadFinalizable.newInThread (dup_ ptr)
                val () = ThreadFinalizable.addFinalizer (t, free_)
              in
                t
              end
          end

        fun takePtr ptr =
          let
            val t = ThreadFinalizable.newInThread (take_ ptr; ptr)
            val () = ThreadFinalizable.addFinalizer (t, free_)
          in
            t
          end

        fun withPtr f t = ThreadFinalizable.withValue (t, f)

        fun giveDupPtr f =
          let
            fun check f ptr = f ptr handle e => (free_ ptr; raise e)
          in
            fn t => ThreadFinalizable.withValue (t, check f o dup_)
          end

        val touchPtr = ThreadFinalizable.touch
      end

    structure FFI =
      struct
        structure Pointer = C.Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        local
          fun withPointer free f ptr =
            Pointer.withVal f ptr handle e => (free ptr; raise e)

          fun withOptPointer free f optptr =
            Pointer.withOptVal f optptr
              handle e => (Option.app free optptr; raise e)
        in
          fun withPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                ptr => ThreadFinalizable.withValue (ptr, withPointer ignore f)
            else
              fn f =>
              fn
                ptr => ThreadFinalizable.withValue (ptr, withPointer free_ f o dup_)

          fun withOptPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                SOME ptr => ThreadFinalizable.withValue (ptr, withOptPointer ignore f o SOME)
              | NONE     => withOptPointer ignore f NONE
            else
              fn f =>
              fn
                SOME ptr => ThreadFinalizable.withValue (ptr, withOptPointer free_ f o SOME o dup_)
              | NONE     => withOptPointer ignore f NONE
        end

        local
          fun withRefPointer free f ptr =
            Pointer.withRefVal f ptr handle e => (free ptr; raise e)

          fun withRefOptPointer free f optptr =
            Pointer.withRefOptVal f optptr
              handle e => (Option.app free optptr; raise e)
        in
          fun withRefPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                ptr => ThreadFinalizable.withValue (ptr, withRefPointer ignore f)
            else
              fn f =>
              fn
                ptr => ThreadFinalizable.withValue (ptr, withRefPointer free_ f o dup_)

          fun withRefOptPtr transfer =
            if not transfer
            then
              fn f =>
              fn
                SOME ptr => ThreadFinalizable.withValue (ptr, withRefOptPointer ignore f o SOME)
              | NONE     => withRefOptPointer ignore f NONE
            else
              fn f =>
              fn
                SOME ptr => ThreadFinalizable.withValue (ptr, withRefOptPointer free_ f o SOME o dup_)
              | NONE     => withRefOptPointer ignore f NONE
        end

        fun fromPtr transfer ptr =
          let
            val t =
              ThreadFinalizable.newInThread (
                if transfer
                then (
                  take_ ptr; ptr  (* take the existing reference *)
                )
                else dup_ ptr
              )
            val () = ThreadFinalizable.addFinalizer (t, free_)
          in
            t
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.fromOptVal optptr)

        val touchPtr = ThreadFinalizable.touch

        fun touchOptPtr t = Option.app touchPtr t
      end

    structure PolyML =
      struct
        val cPtr = C.Pointer.PolyML.cVal
        val cOptPtr = C.Pointer.PolyML.cOptVal
        val cOutRef = C.Pointer.PolyML.cRef
        val cOutOptRef = C.Pointer.PolyML.cOptOutRef
        val cInOutRef = C.Pointer.PolyML.cInRef
        val cInOutOptRef = C.Pointer.PolyML.cOptOutRef
      end

    fun toBase obj = obj
    fun toDerived subclass obj = (
      FFI.withPtr false (checkInstance_ subclass) obj;
      obj
    )
    fun toDerivedUnchecked obj = obj
  end
