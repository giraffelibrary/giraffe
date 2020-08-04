structure GLibMarkupParseContext :>
  G_LIB_MARKUP_PARSE_CONTEXT
    where type t = GLibMarkupParseContextRecord.t =
  struct
    val getType_ = _import "g_markup_parse_context_get_type" : unit -> GObjectType.FFI.val_;
    val endParse_ = fn x1 & x2 => (_import "g_markup_parse_context_end_parse" : GLibMarkupParseContextRecord.FFI.non_opt GLibMarkupParseContextRecord.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val getElement_ = _import "g_markup_parse_context_get_element" : GLibMarkupParseContextRecord.FFI.non_opt GLibMarkupParseContextRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val parse_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_markup_parse_context_parse" :
              GLibMarkupParseContextRecord.FFI.non_opt GLibMarkupParseContextRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type t = GLibMarkupParseContextRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun endParse self = (GLibMarkupParseContextRecord.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) endParse_ (self & [])
    fun getElement self = (GLibMarkupParseContextRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getElement_ self
    fun parse self (text, textLen) =
      (
        GLibMarkupParseContextRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        parse_
        (
          self
           & text
           & textLen
           & []
        )
  end
