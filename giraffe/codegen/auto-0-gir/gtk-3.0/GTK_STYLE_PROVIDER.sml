signature GTK_STYLE_PROVIDER =
  sig
    type 'a class
    type 'a icon_factory_class
    type 'a style_properties_class
    type state_flags_t
    type widget_path_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getIconFactory :
      'a class
       -> widget_path_t
       -> base icon_factory_class option
    val getStyle :
      'a class
       -> widget_path_t
       -> base style_properties_class option
    val getStyleProperty :
      'a class
       -> widget_path_t
           * state_flags_t
           * 'b GObject.ParamSpecClass.class
       -> GObject.ValueRecord.t option
  end
