signature GDK_G_L_CONTEXT =
  sig
    type 'a class
    type 'a display_class
    type 'a window_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val clearCurrent : unit -> unit
    val getCurrent : unit -> base class option
    val getDebugEnabled : 'a class -> bool
    val getDisplay : 'a class -> base display_class option
    val getForwardCompatible : 'a class -> bool
    val getRequiredVersion : 'a class -> LargeInt.int * LargeInt.int
    val getSharedContext : 'a class -> base class option
    val getUseEs : 'a class -> bool
    val getVersion : 'a class -> LargeInt.int * LargeInt.int
    val getWindow : 'a class -> base window_class option
    val isLegacy : 'a class -> bool
    val makeCurrent : 'a class -> unit
    val realize : 'a class -> unit
    val setDebugEnabled :
      'a class
       -> bool
       -> unit
    val setForwardCompatible :
      'a class
       -> bool
       -> unit
    val setRequiredVersion :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setUseEs :
      'a class
       -> LargeInt.int
       -> unit
    val displayProp : ('a class, base display_class option, 'b display_class option) Property.readwrite
    val sharedContextProp : ('a class, base class option, 'b class option) Property.readwrite
    val windowProp : ('a class, base window_class option, 'b window_class option) Property.readwrite
  end
