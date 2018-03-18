structure GtkSourceMark :>
  GTK_SOURCE_MARK
    where type 'a class = 'a GtkSourceMarkClass.class =
  struct
    val getType_ = _import "gtk_source_mark_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_gtk_source_mark_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GtkSourceMarkClass.FFI.notnull GtkSourceMarkClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getCategory_ = _import "gtk_source_mark_get_category" : GtkSourceMarkClass.FFI.notnull GtkSourceMarkClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val next_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_mark_next" :
              GtkSourceMarkClass.FFI.notnull GtkSourceMarkClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit GtkSourceMarkClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val prev_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_mark_prev" :
              GtkSourceMarkClass.FFI.notnull GtkSourceMarkClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit GtkSourceMarkClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceMarkClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (name, category) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSourceMarkClass.FFI.fromPtr true) new_ (name & category)
    fun getCategory self = (GtkSourceMarkClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCategory_ self
    fun next self category = (GtkSourceMarkClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> GtkSourceMarkClass.FFI.fromOptPtr false) next_ (self & category)
    fun prev self category = (GtkSourceMarkClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSourceMarkClass.FFI.fromOptPtr false) prev_ (self & category)
    local
      open Property
    in
      val categoryProp =
        {
          get = fn x => get "category" stringOpt x,
          new = fn x => new "category" stringOpt x
        }
    end
  end
