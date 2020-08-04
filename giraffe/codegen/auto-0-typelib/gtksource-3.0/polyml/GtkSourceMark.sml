structure GtkSourceMark :>
  GTK_SOURCE_MARK
    where type 'a class = 'a GtkSourceMarkClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_mark_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_mark_new") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GtkSourceMarkClass.PolyML.cPtr)
      val getCategory_ = call (getSymbol "gtk_source_mark_get_category") (GtkSourceMarkClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val next_ = call (getSymbol "gtk_source_mark_next") (GtkSourceMarkClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> GtkSourceMarkClass.PolyML.cOptPtr)
      val prev_ = call (getSymbol "gtk_source_mark_prev") (GtkSourceMarkClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkSourceMarkClass.PolyML.cOptPtr)
    end
    type 'a class = 'a GtkSourceMarkClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (name, category) = (Utf8.FFI.withPtr 0 &&&> Utf8.FFI.withPtr 0 ---> GtkSourceMarkClass.FFI.fromPtr true) new_ (name & category)
    fun getCategory self = (GtkSourceMarkClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCategory_ self
    fun next self category = (GtkSourceMarkClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GtkSourceMarkClass.FFI.fromOptPtr false) next_ (self & category)
    fun prev self category = (GtkSourceMarkClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkSourceMarkClass.FFI.fromOptPtr false) prev_ (self & category)
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
