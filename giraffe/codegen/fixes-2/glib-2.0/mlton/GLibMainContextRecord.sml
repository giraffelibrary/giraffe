structure GLibMainContextRecord :>
  sig
    include G_LIB_MAIN_CONTEXT_RECORD
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t

    val new_ = _import "g_main_context_new" : unit -> notnull p;

    val ref_ = _import "g_main_context_ref" : notnull p -> notnull p;

    val unref_ = _import "g_main_context_unref" : notnull p -> unit;

    type t = notnull p Finalizable.t

    structure C =
      struct
        structure Pointer = CPointer
        type notnull = notnull
        type 'a p = 'a p

        fun withPtr f x = Finalizable.withValue (x, f)

        fun withOptPtr f =
          fn
            SOME ptr => withPtr (f o Pointer.toOptNull) ptr
          | NONE     => f Pointer.null

        fun withNewPtr f () =
          let
            val ptr = new_ ()
          in
            ptr & f ptr
          end

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then ptr  (* take the existing reference *)
                else ref_ ptr
              )
          in
            Finalizable.addFinalizer (object, unref_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)
      end
  end
