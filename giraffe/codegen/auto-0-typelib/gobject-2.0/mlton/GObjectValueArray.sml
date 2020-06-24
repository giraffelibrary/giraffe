structure GObjectValueArray :>
  G_OBJECT_VALUE_ARRAY
    where type t = GObjectValueArrayRecord.t
    where type type_t = GObjectType.t
    where type value_t = GObjectValueRecord.t =
  struct
    val getType_ = _import "g_value_array_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_value_array_new" : GUInt32.FFI.val_ -> GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p;
    val append_ = fn x1 & x2 => (_import "g_value_array_append" : GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p * GObjectValueRecord.FFI.opt GObjectValueRecord.FFI.p -> GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p;) (x1, x2)
    val copy_ = _import "g_value_array_copy" : GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p -> GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p;
    val getNth_ = fn x1 & x2 => (_import "g_value_array_get_nth" : GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p * GUInt32.FFI.val_ -> GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p;) (x1, x2)
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_value_array_insert" :
              GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p
               * GUInt32.FFI.val_
               * GObjectValueRecord.FFI.opt GObjectValueRecord.FFI.p
               -> GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val prepend_ = fn x1 & x2 => (_import "g_value_array_prepend" : GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p * GObjectValueRecord.FFI.opt GObjectValueRecord.FFI.p -> GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p;) (x1, x2)
    val remove_ = fn x1 & x2 => (_import "g_value_array_remove" : GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p * GUInt32.FFI.val_ -> GObjectValueArrayRecord.FFI.non_opt GObjectValueArrayRecord.FFI.p;) (x1, x2)
    type t = GObjectValueArrayRecord.t
    type type_t = GObjectType.t
    type value_t = GObjectValueRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new nPrealloced = (GUInt32.FFI.withVal ---> GObjectValueArrayRecord.FFI.fromPtr true) new_ nPrealloced
    fun append self value = (GObjectValueArrayRecord.FFI.withPtr &&&> GObjectValueRecord.FFI.withOptPtr ---> GObjectValueArrayRecord.FFI.fromPtr false) append_ (self & value)
    fun copy self = (GObjectValueArrayRecord.FFI.withPtr ---> GObjectValueArrayRecord.FFI.fromPtr true) copy_ self
    fun getNth self index = (GObjectValueArrayRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GObjectValueRecord.FFI.fromPtr false) getNth_ (self & index)
    fun insert self (index, value) =
      (
        GObjectValueArrayRecord.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GObjectValueRecord.FFI.withOptPtr
         ---> GObjectValueArrayRecord.FFI.fromPtr false
      )
        insert_
        (
          self
           & index
           & value
        )
    fun prepend self value = (GObjectValueArrayRecord.FFI.withPtr &&&> GObjectValueRecord.FFI.withOptPtr ---> GObjectValueArrayRecord.FFI.fromPtr false) prepend_ (self & value)
    fun remove self index = (GObjectValueArrayRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GObjectValueArrayRecord.FFI.fromPtr false) remove_ (self & index)
  end
