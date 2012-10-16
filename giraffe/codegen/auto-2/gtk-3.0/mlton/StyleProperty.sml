structure StyleProperty :>
  STYLE_PROPERTY
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    val getProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_widget_style_get_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )

    type 'a widgetclass_t = 'a GtkWidgetClass.t

    fun getProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        getProperty_
        (
          self
           & propertyName
           & value
        )

    type ('objectclass, 'a) readonly = {get : 'objectclass -> 'a}

    fun get name t object =
      let
        val value = GObjectValue.init (GObjectValue.baseType t)
      in
        getProperty object name value;
        GObjectValue.get t value
      end
  end
