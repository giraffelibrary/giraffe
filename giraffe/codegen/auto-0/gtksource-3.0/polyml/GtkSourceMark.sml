structure GtkSourceMark :>
  GTK_SOURCE_MARK
    where type 'a class_t = 'a GtkSourceMarkClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_mark_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtksourceview "gtk_source_mark_new") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getCategory_ = call (load_sym libgtksourceview "gtk_source_mark_get_category") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val next_ = call (load_sym libgtksourceview "gtk_source_mark_next") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> GObjectObjectClass.PolyML.PTR)
      val prev_ = call (load_sym libgtksourceview "gtk_source_mark_prev") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkSourceMarkClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name category = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> GtkSourceMarkClass.C.fromPtr true) new_ (name & category)
    fun getCategory self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getCategory_ self
    fun next self category = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> GtkSourceMarkClass.C.fromPtr false) next_ (self & category)
    fun prev self category = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> GtkSourceMarkClass.C.fromPtr false) prev_ (self & category)
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
