structure GioMenuAttributeIter :>
  GIO_MENU_ATTRIBUTE_ITER
    where type 'a class = 'a GioMenuAttributeIterClass.class =
  struct
    val getType_ = _import "g_menu_attribute_iter_get_type" : unit -> GObjectType.FFI.val_;
    val getName_ = _import "g_menu_attribute_iter_get_name" : GioMenuAttributeIterClass.FFI.non_opt GioMenuAttributeIterClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getNext_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_menu_attribute_iter_get_next" :
              GioMenuAttributeIterClass.FFI.non_opt GioMenuAttributeIterClass.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (GLibVariantRecord.FFI.opt, GLibVariantRecord.FFI.non_opt) GLibVariantRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getValue_ = _import "g_menu_attribute_iter_get_value" : GioMenuAttributeIterClass.FFI.non_opt GioMenuAttributeIterClass.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val next_ = _import "g_menu_attribute_iter_next" : GioMenuAttributeIterClass.FFI.non_opt GioMenuAttributeIterClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GioMenuAttributeIterClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getName self = (GioMenuAttributeIterClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNext self =
      let
        val outName
         & value
         & retVal =
          (
            GioMenuAttributeIterClass.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibVariantRecord.FFI.withRefOptPtr
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
    fun getValue self = (GioMenuAttributeIterClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) getValue_ self
    fun next self = (GioMenuAttributeIterClass.FFI.withPtr ---> GBool.FFI.fromVal) next_ self
  end
