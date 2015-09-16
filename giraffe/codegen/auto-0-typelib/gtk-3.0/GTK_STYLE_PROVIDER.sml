signature GTK_STYLE_PROVIDER =
  sig
    type 'a class_t
    type 'a icon_factory_class_t
    type 'a style_properties_class_t
    type state_flags_t
    type widget_path_record_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getIconFactory :
      'a class_t
       -> widget_path_record_t
       -> base icon_factory_class_t
    val getStyle :
      'a class_t
       -> widget_path_record_t
       -> base style_properties_class_t
    val getStyleProperty :
      'a class_t
       -> widget_path_record_t
       -> state_flags_t
       -> 'b GObject.ParamSpecClass.t
       -> GObject.ValueRecord.t option
  end
