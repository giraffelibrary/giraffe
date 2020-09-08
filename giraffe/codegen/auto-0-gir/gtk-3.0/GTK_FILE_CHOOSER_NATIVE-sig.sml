signature GTK_FILE_CHOOSER_NATIVE =
  sig
    type 'a class
    type 'a file_chooser_class
    type file_chooser_action_t
    type 'a window_class
    type t = base class
    val asFileChooser : 'a class -> base file_chooser_class
    val getType : unit -> GObject.Type.t
    val new :
      string option
       * 'a window_class option
       * file_chooser_action_t
       * string option
       * string option
       -> base class
    val getAcceptLabel : 'a class -> string option
    val getCancelLabel : 'a class -> string option
    val setAcceptLabel :
      'a class
       -> string option
       -> unit
    val setCancelLabel :
      'a class
       -> string option
       -> unit
    val acceptLabelProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val cancelLabelProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
