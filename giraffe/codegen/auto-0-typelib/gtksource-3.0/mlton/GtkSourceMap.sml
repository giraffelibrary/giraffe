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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceMapClass.FFI.fromPtr false) new_ ()
    fun getView self = (GtkSourceMapClass.FFI.withPtr false ---> GtkSourceViewClass.FFI.fromOptPtr false) getView_ self before GtkSourceMapClass.FFI.touchPtr self
    fun setView self view = (GtkSourceMapClass.FFI.withPtr false &&&> GtkSourceViewClass.FFI.withPtr false ---> I) setView_ (self & view)
    local
      open ValueAccessor
    in
      val fontDescProp =
        {
          name = "font-desc",
          gtype = fn () => C.gtype PangoFontDescriptionRecord.tOpt (),
          get = fn x => fn () => C.get PangoFontDescriptionRecord.tOpt x,
          set = fn x => C.set PangoFontDescriptionRecord.tOpt x,
          init = fn x => C.set PangoFontDescriptionRecord.tOpt x
        }
      val viewProp =
        {
          name = "view",
          gtype = fn () => C.gtype GtkSourceViewClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceViewClass.tOpt x,
          set = fn x => C.set GtkSourceViewClass.tOpt x,
          init = fn x => C.set GtkSourceViewClass.tOpt x
        }
    end
  end
