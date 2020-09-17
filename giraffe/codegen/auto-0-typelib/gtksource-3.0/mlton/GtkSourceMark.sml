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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkSourceMarkClass.FFI.non_opt GtkSourceMarkClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getCategory_ = _import "gtk_source_mark_get_category" : GtkSourceMarkClass.FFI.non_opt GtkSourceMarkClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val next_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_mark_next" :
              GtkSourceMarkClass.FFI.non_opt GtkSourceMarkClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GtkSourceMarkClass.FFI.opt GtkSourceMarkClass.FFI.p;
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
              GtkSourceMarkClass.FFI.non_opt GtkSourceMarkClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkSourceMarkClass.FFI.opt GtkSourceMarkClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceMarkClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (name, category) = (Utf8.FFI.withPtr 0 &&&> Utf8.FFI.withPtr 0 ---> GtkSourceMarkClass.FFI.fromPtr true) new_ (name & category)
    fun getCategory self = (GtkSourceMarkClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCategory_ self before GtkSourceMarkClass.FFI.touchPtr self
    fun next self category = (GtkSourceMarkClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GtkSourceMarkClass.FFI.fromOptPtr false) next_ (self & category) before GtkSourceMarkClass.FFI.touchPtr self before Utf8.FFI.touchOptPtr category
    fun prev self category = (GtkSourceMarkClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkSourceMarkClass.FFI.fromOptPtr false) prev_ (self & category) before GtkSourceMarkClass.FFI.touchPtr self before Utf8.FFI.touchPtr category
    local
      open ValueAccessor
    in
      val categoryProp =
        {
          name = "category",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
    end
  end
