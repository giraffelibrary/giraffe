structure GtkSourceMark :>
  GTK_SOURCE_MARK
    where type 'a class = 'a GtkSourceMarkClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_mark_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_mark_new") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GtkSourceMarkClass.PolyML.cPtr)
      val getCategory_ = call (load_sym libgtksourceview "gtk_source_mark_get_category") (GtkSourceMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val next_ = call (load_sym libgtksourceview "gtk_source_mark_next") (GtkSourceMarkClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> GtkSourceMarkClass.PolyML.cPtr)
      val prev_ = call (load_sym libgtksourceview "gtk_source_mark_prev") (GtkSourceMarkClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkSourceMarkClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkSourceMarkClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name category = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> GtkSourceMarkClass.C.fromPtr true) new_ (name & category)
    fun getCategory self = (GtkSourceMarkClass.C.withPtr ---> Utf8.C.fromPtr false) getCategory_ self
    fun next self category = (GtkSourceMarkClass.C.withPtr &&&> Utf8.C.withOptPtr ---> GtkSourceMarkClass.C.fromPtr false) next_ (self & category)
    fun prev self category = (GtkSourceMarkClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkSourceMarkClass.C.fromPtr false) prev_ (self & category)
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
