signature GTK_FONT_BUTTON =
  sig
    type 'a class_t
    type 'a activatableclass_t
    type 'a buildableclass_t
    type 'a fontchooserclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asFontChooser : 'a class_t -> base fontchooserclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithFont : string -> base class_t
    val getFontName : 'a class_t -> string
    val getShowSize : 'a class_t -> bool
    val getShowStyle : 'a class_t -> bool
    val getTitle : 'a class_t -> string
    val getUseFont : 'a class_t -> bool
    val getUseSize : 'a class_t -> bool
    val setFontName :
      'a class_t
       -> string
       -> bool
    val setShowSize :
      'a class_t
       -> bool
       -> unit
    val setShowStyle :
      'a class_t
       -> bool
       -> unit
    val setTitle :
      'a class_t
       -> string
       -> unit
    val setUseFont :
      'a class_t
       -> bool
       -> unit
    val setUseSize :
      'a class_t
       -> bool
       -> unit
    val fontSetSig : (unit -> unit) -> 'a class_t Signal.signal
    val fontNameProp : ('a class_t, string option, string option) Property.readwrite
    val showSizeProp : ('a class_t, bool, bool) Property.readwrite
    val showStyleProp : ('a class_t, bool, bool) Property.readwrite
    val titleProp : ('a class_t, string option, string option) Property.readwrite
    val useFontProp : ('a class_t, bool, bool) Property.readwrite
    val useSizeProp : ('a class_t, bool, bool) Property.readwrite
  end
