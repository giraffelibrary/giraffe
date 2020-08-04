structure GtkSourceMap :>
  GTK_SOURCE_MAP
    where type 'a class = 'a GtkSourceMapClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_map_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_map_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getView_ = call (getSymbol "gtk_source_map_get_view") (GtkSourceMapClass.PolyML.cPtr --> GtkSourceViewClass.PolyML.cOptPtr)
      val setView_ = call (getSymbol "gtk_source_map_set_view") (GtkSourceMapClass.PolyML.cPtr &&> GtkSourceViewClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkSourceMapClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceMapClass.FFI.fromPtr false) new_ ()
    fun getView self = (GtkSourceMapClass.FFI.withPtr false ---> GtkSourceViewClass.FFI.fromOptPtr false) getView_ self
    fun setView self view = (GtkSourceMapClass.FFI.withPtr false &&&> GtkSourceViewClass.FFI.withPtr false ---> I) setView_ (self & view)
    local
      open Property
    in
      val fontDescProp =
        {
          get = fn x => get "font-desc" PangoFontDescriptionRecord.tOpt x,
          set = fn x => set "font-desc" PangoFontDescriptionRecord.tOpt x,
          new = fn x => new "font-desc" PangoFontDescriptionRecord.tOpt x
        }
      val viewProp =
        {
          get = fn x => get "view" GtkSourceViewClass.tOpt x,
          set = fn x => set "view" GtkSourceViewClass.tOpt x,
          new = fn x => new "view" GtkSourceViewClass.tOpt x
        }
    end
  end
