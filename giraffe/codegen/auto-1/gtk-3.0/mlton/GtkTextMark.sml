structure GtkTextMark :>
  GTK_TEXT_MARK
    where type 'a class_t = 'a GtkTextMarkClass.t
    where type 'a textbufferclass_t = 'a GtkTextBufferClass.t =
  struct
    val getType_ = _import "gtk_text_mark_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_text_mark_new" :
              cstring
               * unit CPointer.t
               * FFI.Bool.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBuffer_ = _import "gtk_text_mark_get_buffer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDeleted_ = _import "gtk_text_mark_get_deleted" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getLeftGravity_ = _import "gtk_text_mark_get_left_gravity" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getName_ = _import "gtk_text_mark_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getVisible_ = _import "gtk_text_mark_get_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val setVisible_ = fn x1 & x2 => (_import "gtk_text_mark_set_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkTextMarkClass.t
    type 'a textbufferclass_t = 'a GtkTextBufferClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name leftGravity = (FFI.String.withConstOptPtr &&&> FFI.Bool.withVal ---> GtkTextMarkClass.C.fromPtr true) new_ (name & leftGravity)
    fun getBuffer self = (GObjectObjectClass.C.withPtr ---> GtkTextBufferClass.C.fromPtr false) getBuffer_ self
    fun getDeleted self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getDeleted_ self
    fun getLeftGravity self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getLeftGravity_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getVisible_ self
    fun setVisible self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setVisible_ (self & setting)
    local
      open Property
    in
      val leftGravityProp =
        {
          get = fn x => get "left-gravity" boolean x,
          set = fn x => set "left-gravity" boolean x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
    end
  end
