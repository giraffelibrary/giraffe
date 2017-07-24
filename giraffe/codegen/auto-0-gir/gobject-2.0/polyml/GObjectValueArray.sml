structure GObjectValueArray :>
  G_OBJECT_VALUE_ARRAY
    where type t = GObjectValueArrayRecord.t
    where type type_t = GObjectType.t
    where type value_t = GObjectValueRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_value_array_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_value_array_new") (GUInt.PolyML.cVal --> GObjectValueArrayRecord.PolyML.cPtr)
      val append_ = call (getSymbol "g_value_array_append") (GObjectValueArrayRecord.PolyML.cPtr &&> GObjectValueRecord.PolyML.cOptPtr --> GObjectValueArrayRecord.PolyML.cPtr)
      val copy_ = call (getSymbol "g_value_array_copy") (GObjectValueArrayRecord.PolyML.cPtr --> GObjectValueArrayRecord.PolyML.cPtr)
      val getNth_ = call (getSymbol "g_value_array_get_nth") (GObjectValueArrayRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> GObjectValueRecord.PolyML.cPtr)
      val insert_ =
        call (getSymbol "g_value_array_insert")
          (
            GObjectValueArrayRecord.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GObjectValueRecord.PolyML.cOptPtr
             --> GObjectValueArrayRecord.PolyML.cPtr
          )
      val prepend_ = call (getSymbol "g_value_array_prepend") (GObjectValueArrayRecord.PolyML.cPtr &&> GObjectValueRecord.PolyML.cOptPtr --> GObjectValueArrayRecord.PolyML.cPtr)
      val remove_ = call (getSymbol "g_value_array_remove") (GObjectValueArrayRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> GObjectValueArrayRecord.PolyML.cPtr)
    end
    type t = GObjectValueArrayRecord.t
    type type_t = GObjectType.t
    type value_t = GObjectValueRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new nPrealloced = (GUInt.FFI.withVal ---> GObjectValueArrayRecord.FFI.fromPtr true) new_ nPrealloced
    fun append self value = (GObjectValueArrayRecord.FFI.withPtr &&&> GObjectValueRecord.FFI.withOptPtr ---> GObjectValueArrayRecord.FFI.fromPtr false) append_ (self & value)
    fun copy self = (GObjectValueArrayRecord.FFI.withPtr ---> GObjectValueArrayRecord.FFI.fromPtr true) copy_ self
    fun getNth self index = (GObjectValueArrayRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> GObjectValueRecord.FFI.fromPtr false) getNth_ (self & index)
    fun insert self (index, value) =
      (
        GObjectValueArrayRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
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
    fun remove self index = (GObjectValueArrayRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> GObjectValueArrayRecord.FFI.fromPtr false) remove_ (self & index)
  end
