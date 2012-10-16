structure GdkGeometryRecord :>
  sig
    include GDK_GEOMETRY_RECORD
  end =
  struct
    type notnull = CPointer.notnull
    type 'a p = 'a CPointer.t

    val copy_ = _import "giraffe_gdk_geometry_copy" : notnull p -> notnull p;

    val free_ = _import "giraffe_gdk_geometry_free" : notnull p -> unit;

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

        fun fromPtr transfer ptr =
          let
            val object =
              Finalizable.new (
                if transfer
                then ptr  (* take the existing reference *)
                else copy_ ptr
              )
          in
            Finalizable.addFinalizer (object, free_);
            object
          end

        fun fromOptPtr transfer optptr =
          Option.map (fromPtr transfer) (Pointer.toOpt optptr)
      end
  end
