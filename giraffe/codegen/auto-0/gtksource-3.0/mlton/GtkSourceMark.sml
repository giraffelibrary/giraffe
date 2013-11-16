structure GtkSourceMark :>
  GTK_SOURCE_MARK
    where type 'a class_t = 'a GtkSourceMarkClass.t =
  struct
    val getType_ = _import "gtk_source_mark_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_gtk_source_mark_new" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getCategory_ = _import "gtk_source_mark_get_category" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val next_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_mark_next" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkSourceMarkClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name category = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> GtkSourceMarkClass.C.fromPtr true) new_ (name & category)
    fun getCategory self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getCategory_ self
    fun next self category = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> GtkSourceMarkClass.C.fromPtr false) next_ (self & category)
    fun prev self category = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkSourceMarkClass.C.fromPtr false) prev_ (self & category)
    local
      open Property
    in
      val categoryProp =
        {
          get = fn x => get "category" stringOpt x,
          set = fn x => set "category" stringOpt x
        }
    end
  end
