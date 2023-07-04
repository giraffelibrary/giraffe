structure GObjectWeakRef :>
  G_OBJECT_WEAK_REF
    where type t = GObjectWeakRefRecord.t
    where type 'a object_class = 'a GObjectObjectClass.class =
  struct
    val get_ = _import "g_weak_ref_get" : GObjectWeakRefRecord.FFI.non_opt GObjectWeakRefRecord.FFI.p -> GObjectObjectClass.FFI.opt GObjectObjectClass.FFI.p;
    val init_ = fn x1 & x2 => (_import "g_weak_ref_init" : GObjectWeakRefRecord.FFI.non_opt GObjectWeakRefRecord.FFI.p * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p -> unit;) (x1, x2)
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
