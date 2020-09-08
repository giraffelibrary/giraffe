structure GtkTextMark :>
  GTK_TEXT_MARK
    where type 'a class = 'a GtkTextMarkClass.class
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    val getType_ = _import "gtk_text_mark_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_text_mark_new" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GBool.FFI.val_
               -> GtkTextMarkClass.FFI.non_opt GtkTextMarkClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBuffer_ = _import "gtk_text_mark_get_buffer" : GtkTextMarkClass.FFI.non_opt GtkTextMarkClass.FFI.p -> GtkTextBufferClass.FFI.non_opt GtkTextBufferClass.FFI.p;
    val getDeleted_ = _import "gtk_text_mark_get_deleted" : GtkTextMarkClass.FFI.non_opt GtkTextMarkClass.FFI.p -> GBool.FFI.val_;
    val getLeftGravity_ = _import "gtk_text_mark_get_left_gravity" : GtkTextMarkClass.FFI.non_opt GtkTextMarkClass.FFI.p -> GBool.FFI.val_;
    val getName_ = _import "gtk_text_mark_get_name" : GtkTextMarkClass.FFI.non_opt GtkTextMarkClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getVisible_ = _import "gtk_text_mark_get_visible" : GtkTextMarkClass.FFI.non_opt GtkTextMarkClass.FFI.p -> GBool.FFI.val_;
    val setVisible_ = fn x1 & x2 => (_import "gtk_text_mark_set_visible" : GtkTextMarkClass.FFI.non_opt GtkTextMarkClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkTextMarkClass.class
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (name, leftGravity) = (Utf8.FFI.withOptPtr 0 &&&> GBool.FFI.withVal ---> GtkTextMarkClass.FFI.fromPtr true) new_ (name & leftGravity)
    fun getBuffer self = (GtkTextMarkClass.FFI.withPtr false ---> GtkTextBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getDeleted self = (GtkTextMarkClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDeleted_ self
    fun getLeftGravity self = (GtkTextMarkClass.FFI.withPtr false ---> GBool.FFI.fromVal) getLeftGravity_ self
    fun getName self = (GtkTextMarkClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getName_ self
    fun getVisible self = (GtkTextMarkClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun setVisible self setting = (GtkTextMarkClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisible_ (self & setting)
    local
      open ValueAccessor
    in
      val leftGravityProp =
        {
          name = "left-gravity",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
