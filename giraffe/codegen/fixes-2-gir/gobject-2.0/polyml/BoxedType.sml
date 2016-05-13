functor BoxedType (
  structure Record :
    RECORD
      where type C.notnull = CPointer.notnull
      where type 'a C.p = 'a CPointer.p
      where type ('a, 'b) C.r = ('a, 'b) CPointer.r
  type t = Record.t
  val getType_ : unit -> GObjectType.C.val_
) :>
  sig
    val t : (t, t) GObjectValue.accessor
    val tOpt : (t option, t option) GObjectValue.accessor
  end =
  struct
    open Record

    local
      open PolyMLFFI
    in
      val getValue_ =
        call
          (load_sym libgobject "g_value_get_boxed")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr);

      val getOptValue_ =
        call
          (load_sym libgobject "g_value_get_boxed")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr);

      val setValue_ =
        call
          (load_sym libgobject "g_value_set_boxed")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> PolyMLFFI.cVoid);

      val setOptValue_ =
        call
          (load_sym libgobject "g_value_set_boxed")
          (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> PolyMLFFI.cVoid);
    end

    val t =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.C.fromVal) getType_,
        getValue = (I ---> C.fromPtr false) getValue_,
        setValue = (I &&&> C.withPtr ---> I) setValue_
      }

    val tOpt =
      GObjectValue.C.createAccessor {
        getType  = (I ---> GObjectType.C.fromVal) getType_,
        getValue = (I ---> C.fromOptPtr false) getOptValue_,
        setValue = (I &&&> C.withOptPtr ---> I) setOptValue_
      }
  end
