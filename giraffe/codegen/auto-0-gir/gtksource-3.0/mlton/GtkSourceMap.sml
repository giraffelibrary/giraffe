structure GtkSourceMap :>
  GTK_SOURCE_MAP
    where type 'a class = 'a GtkSourceMapClass.class
    where type 'a view_class = 'a GtkSourceViewClass.class =
  struct
    val getType_ = _import "gtk_source_map_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_map_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getView_ = _import "gtk_source_map_get_view" : GtkSourceMapClass.FFI.non_opt GtkSourceMapClass.FFI.p -> GtkSourceViewClass.FFI.opt GtkSourceViewClass.FFI.p;
    val setView_ = fn x1 & x2 => (_import "gtk_source_map_set_view" : GtkSourceMapClass.FFI.non_opt GtkSourceMapClass.FFI.p * GtkSourceViewClass.FFI.non_opt GtkSourceViewClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceMapClass.class
    type 'a view_class = 'a GtkSourceViewClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceMapClass.FFI.fromPtr false) new_ ()
    fun getView self = (GtkSourceMapClass.FFI.withPtr ---> GtkSourceViewClass.FFI.fromOptPtr false) getView_ self
    fun setView self view = (GtkSourceMapClass.FFI.withPtr &&&> GtkSourceViewClass.FFI.withPtr ---> I) setView_ (self & view)
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
