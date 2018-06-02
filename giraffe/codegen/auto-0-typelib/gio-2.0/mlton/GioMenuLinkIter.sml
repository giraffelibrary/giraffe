structure GioMenuLinkIter :>
  GIO_MENU_LINK_ITER
    where type 'a class = 'a GioMenuLinkIterClass.class
    where type 'a menu_model_class = 'a GioMenuModelClass.class =
  struct
    val getType_ = _import "g_menu_link_iter_get_type" : unit -> GObjectType.FFI.val_;
    val getName_ = _import "g_menu_link_iter_get_name" : GioMenuLinkIterClass.FFI.notnull GioMenuLinkIterClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getNext_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_menu_link_iter_get_next" :
              GioMenuLinkIterClass.FFI.notnull GioMenuLinkIterClass.FFI.p
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * (unit, GioMenuModelClass.FFI.notnull) GioMenuModelClass.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getValue_ = _import "g_menu_link_iter_get_value" : GioMenuLinkIterClass.FFI.notnull GioMenuLinkIterClass.FFI.p -> GioMenuModelClass.FFI.notnull GioMenuModelClass.FFI.p;
    val next_ = _import "g_menu_link_iter_next" : GioMenuLinkIterClass.FFI.notnull GioMenuLinkIterClass.FFI.p -> GBool.FFI.val_;
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