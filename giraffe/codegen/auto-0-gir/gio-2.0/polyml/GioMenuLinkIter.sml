structure GioMenuLinkIter :>
  GIO_MENU_LINK_ITER
    where type 'a class = 'a GioMenuLinkIterClass.class
    where type 'a menu_model_class = 'a GioMenuModelClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_menu_link_iter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getName_ = call (getSymbol "g_menu_link_iter_get_name") (GioMenuLinkIterClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNext_ =
        call (getSymbol "g_menu_link_iter_get_next")
          (
            GioMenuLinkIterClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> GioMenuModelClass.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val getValue_ = call (getSymbol "g_menu_link_iter_get_value") (GioMenuLinkIterClass.PolyML.cPtr --> GioMenuModelClass.PolyML.cPtr)
      val next_ = call (getSymbol "g_menu_link_iter_next") (GioMenuLinkIterClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioMenuLinkIterClass.class
    type 'a menu_model_class = 'a GioMenuModelClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getName self = (GioMenuLinkIterClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNext self =
      let
        val outLink
         & value
         & retVal =
          (
            GioMenuLinkIterClass.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GioMenuModelClass.FFI.withRefOptPtr
             ---> Utf8.FFI.fromPtr 0
                   && GioMenuModelClass.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            getNext_
            (
              self
               & NONE
               & NONE
            )
      in
        if retVal then SOME (outLink, value) else NONE
      end
    fun getValue self = (GioMenuLinkIterClass.FFI.withPtr ---> GioMenuModelClass.FFI.fromPtr true) getValue_ self
    fun next self = (GioMenuLinkIterClass.FFI.withPtr ---> GBool.FFI.fromVal) next_ self
  end
