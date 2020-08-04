structure GioMenuAttributeIter :>
  GIO_MENU_ATTRIBUTE_ITER
    where type 'a class = 'a GioMenuAttributeIterClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_menu_attribute_iter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getName_ = call (getSymbol "g_menu_attribute_iter_get_name") (GioMenuAttributeIterClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNext_ =
        call (getSymbol "g_menu_attribute_iter_get_next")
          (
            GioMenuAttributeIterClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> GLibVariantRecord.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val getValue_ = call (getSymbol "g_menu_attribute_iter_get_value") (GioMenuAttributeIterClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val next_ = call (getSymbol "g_menu_attribute_iter_next") (GioMenuAttributeIterClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioMenuAttributeIterClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getName self = (GioMenuAttributeIterClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNext self =
      let
        val outName
         & value
         & retVal =
          (
            GioMenuAttributeIterClass.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GLibVariantRecord.FFI.withRefOptPtr true
             ---> Utf8.FFI.fromPtr 0
                   && GLibVariantRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            getNext_
            (
              self
               & NONE
               & NONE
            )
      in
        if retVal then SOME (outName, value) else NONE
      end
    fun getValue self = (GioMenuAttributeIterClass.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr true) getValue_ self
    fun next self = (GioMenuAttributeIterClass.FFI.withPtr false ---> GBool.FFI.fromVal) next_ self
  end
