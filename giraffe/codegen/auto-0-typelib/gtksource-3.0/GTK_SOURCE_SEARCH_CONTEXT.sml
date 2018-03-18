signature GTK_SOURCE_SEARCH_CONTEXT =
  sig
    type 'a class
    type 'a buffer_class
    type 'a style_class
    type 'a search_settings_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : 'a buffer_class * 'b search_settings_class option -> base class
    val backward :
      'a class
       -> Gtk.TextIterRecord.t
       -> (Gtk.TextIterRecord.t * Gtk.TextIterRecord.t) option
    val backward2 :
      'a class
       -> Gtk.TextIterRecord.t
       -> (Gtk.TextIterRecord.t
            * Gtk.TextIterRecord.t
            * bool)
            option
    val backwardFinish :
      'a class
       -> 'b Gio.AsyncResultClass.class
       -> Gtk.TextIterRecord.t * Gtk.TextIterRecord.t
    val backwardFinish2 :
      'a class
       -> 'b Gio.AsyncResultClass.class
       -> Gtk.TextIterRecord.t
           * Gtk.TextIterRecord.t
           * bool
    val forward :
      'a class
       -> Gtk.TextIterRecord.t
       -> (Gtk.TextIterRecord.t * Gtk.TextIterRecord.t) option
    val forward2 :
      'a class
       -> Gtk.TextIterRecord.t
       -> (Gtk.TextIterRecord.t
            * Gtk.TextIterRecord.t
            * bool)
            option
    val forwardFinish :
      'a class
       -> 'b Gio.AsyncResultClass.class
       -> Gtk.TextIterRecord.t * Gtk.TextIterRecord.t
    val forwardFinish2 :
      'a class
       -> 'b Gio.AsyncResultClass.class
       -> Gtk.TextIterRecord.t
           * Gtk.TextIterRecord.t
           * bool
    val getBuffer : 'a class -> base buffer_class
    val getHighlight : 'a class -> bool
    val getMatchStyle : 'a class -> base style_class
    val getOccurrencePosition :
      'a class
       -> Gtk.TextIterRecord.t * Gtk.TextIterRecord.t
       -> LargeInt.int
    val getOccurrencesCount : 'a class -> LargeInt.int
    val getSettings : 'a class -> base search_settings_class
    val replace :
      'a class
       -> Gtk.TextIterRecord.t
           * Gtk.TextIterRecord.t
           * string
           * LargeInt.int
       -> unit
    val replace2 :
      'a class
       -> Gtk.TextIterRecord.t
           * Gtk.TextIterRecord.t
           * string
           * LargeInt.int
       -> unit
    val replaceAll :
      'a class
       -> string * LargeInt.int
       -> LargeInt.int
    val setHighlight :
      'a class
       -> bool
       -> unit
    val setMatchStyle :
      'a class
       -> 'b style_class option
       -> unit
    val setSettings :
      'a class
       -> 'b search_settings_class option
       -> unit
    val bufferProp :
      {
        get : 'a class -> base buffer_class option,
        new : 'b buffer_class option -> 'a class Property.t
      }
    val highlightProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val matchStyleProp :
      {
        get : 'a class -> base style_class option,
        set :
          'b style_class option
           -> 'a class
           -> unit,
        new : 'b style_class option -> 'a class Property.t
      }
    val occurrencesCountProp : {get : 'a class -> LargeInt.int}
    val settingsProp :
      {
        get : 'a class -> base search_settings_class option,
        set :
          'b search_settings_class option
           -> 'a class
           -> unit,
        new : 'b search_settings_class option -> 'a class Property.t
      }
  end
