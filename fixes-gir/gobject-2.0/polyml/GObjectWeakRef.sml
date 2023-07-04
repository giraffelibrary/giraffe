structure GObjectWeakRef :>
  G_OBJECT_WEAK_REF
    where type t = GObjectWeakRefRecord.t
    where type 'a object_class = 'a GObjectObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val get_ = call (externalFunctionSymbol "g_weak_ref_get") (GObjectWeakRefRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cOptPtr)
      val init_ = call (externalFunctionSymbol "g_weak_ref_init") (GObjectWeakRefRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> cVoid)
    end
    type t = GObjectWeakRefRecord.t
    type 'a object_class = 'a GObjectObjectClass.class
    local
      val call = GObjectWeakRefRecord.FFI.withPtr false ---> GObjectObjectClass.FFI.fromOptPtr true
    in
      fun get self = call get_ self
    end
    local
      val call = GObjectWeakRefRecord.FFI.withNewPtr &&&> GObjectObjectClass.FFI.withPtr false ---> GObjectWeakRefRecord.FFI.fromPtr true && I
    in
      fun init object =
        let
          val weakRef & () = call init_ (() & GObjectObjectClass.toBase object)
        in
          weakRef
        end
    end
  end
