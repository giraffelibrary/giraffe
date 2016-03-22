structure GtkTextMark :>
  GTK_TEXT_MARK
    where type 'a class = 'a GtkTextMarkClass.class
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    val getType_ = _import "gtk_text_mark_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_text_mark_new" :
              Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * FFI.Bool.C.val_
               -> GtkTextMarkClass.C.notnull GtkTextMarkClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBuffer_ = _import "gtk_text_mark_get_buffer" : GtkTextMarkClass.C.notnull GtkTextMarkClass.C.p -> GtkTextBufferClass.C.notnull GtkTextBufferClass.C.p;
    val getDeleted_ = _import "gtk_text_mark_get_deleted" : GtkTextMarkClass.C.notnull GtkTextMarkClass.C.p -> FFI.Bool.C.val_;
    val getLeftGravity_ = _import "gtk_text_mark_get_left_gravity" : GtkTextMarkClass.C.notnull GtkTextMarkClass.C.p -> FFI.Bool.C.val_;
    val getName_ = _import "gtk_text_mark_get_name" : GtkTextMarkClass.C.notnull GtkTextMarkClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getVisible_ = _import "gtk_text_mark_get_visible" : GtkTextMarkClass.C.notnull GtkTextMarkClass.C.p -> FFI.Bool.C.val_;
    val setVisible_ = fn x1 & x2 => (_import "gtk_text_mark_set_visible" : GtkTextMarkClass.C.notnull GtkTextMarkClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkTextMarkClass.class
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name leftGravity = (Utf8.C.withOptPtr &&&> FFI.Bool.C.withVal ---> GtkTextMarkClass.C.fromPtr true) new_ (name & leftGravity)
    fun getBuffer self = (GtkTextMarkClass.C.withPtr ---> GtkTextBufferClass.C.fromPtr false) getBuffer_ self
    fun getDeleted self = (GtkTextMarkClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeleted_ self
    fun getLeftGravity self = (GtkTextMarkClass.C.withPtr ---> FFI.Bool.C.fromVal) getLeftGravity_ self
    fun getName self = (GtkTextMarkClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getVisible self = (GtkTextMarkClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun setVisible self setting = (GtkTextMarkClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & setting)
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
