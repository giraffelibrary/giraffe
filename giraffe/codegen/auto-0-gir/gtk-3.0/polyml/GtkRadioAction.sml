structure GtkRadioAction :>
  GTK_RADIO_ACTION
    where type 'a class_t = 'a GtkRadioActionClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_radio_action_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ =
        call (load_sym libgtk "gtk_radio_action_new")
          (
            Utf8.PolyML.INPTR
             &&> Utf8.PolyML.INOPTPTR
             &&> Utf8.PolyML.INOPTPTR
             &&> Utf8.PolyML.INOPTPTR
             &&> FFI.Int.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val getCurrentValue_ = call (load_sym libgtk "gtk_radio_action_get_current_value") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val joinGroup_ = call (load_sym libgtk "gtk_radio_action_join_group") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setCurrentValue_ = call (load_sym libgtk "gtk_radio_action_set_current_value") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkRadioActionClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name label tooltip stockId value =
      (
        Utf8.C.withConstPtr
         &&&> Utf8.C.withConstOptPtr
         &&&> Utf8.C.withConstOptPtr
         &&&> Utf8.C.withConstOptPtr
         &&&> FFI.Int.C.withVal
         ---> GtkRadioActionClass.C.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
           & value
        )
    fun getCurrentValue self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getCurrentValue_ self
    fun joinGroup self groupSource = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) joinGroup_ (self & groupSource)
    fun setCurrentValue self currentValue = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setCurrentValue_ (self & currentValue)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (get 0w1 GtkRadioActionClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val currentValueProp =
        {
          get = fn x => get "current-value" int x,
          set = fn x => set "current-value" int x
        }
      val groupProp = {set = fn x => set "group" GtkRadioActionClass.tOpt x}
      val valueProp =
        {
          get = fn x => get "value" int x,
          set = fn x => set "value" int x
        }
    end
  end
