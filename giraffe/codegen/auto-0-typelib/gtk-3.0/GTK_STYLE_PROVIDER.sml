signature GTK_STYLE_PROVIDER =
  sig
    type 'a class_t
    type 'a iconfactoryclass_t
    type 'a stylepropertiesclass_t
    type stateflags_t
    type widgetpathrecord_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getIconFactory :
      'a class_t
       -> widgetpathrecord_t
       -> base iconfactoryclass_t
    val getStyle :
      'a class_t
       -> widgetpathrecord_t
       -> base stylepropertiesclass_t
    val getStyleProperty :
      'a class_t
       -> widgetpathrecord_t
       -> stateflags_t
       -> 'b GObject.ParamSpecClass.t
       -> GObject.ValueRecord.t option
  end
