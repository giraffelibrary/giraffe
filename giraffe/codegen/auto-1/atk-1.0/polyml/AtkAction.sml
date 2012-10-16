structure AtkAction :>
  ATK_ACTION
    where type 'a class_t = 'a AtkActionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_action_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val doAction_ = call (load_sym libatk "atk_action_do_action") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val getDescription_ = call (load_sym libatk "atk_action_get_description") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val getKeybinding_ = call (load_sym libatk "atk_action_get_keybinding") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val getLocalizedName_ = call (load_sym libatk "atk_action_get_localized_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val getNActions_ = call (load_sym libatk "atk_action_get_n_actions") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getName_ = call (load_sym libatk "atk_action_get_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val setDescription_ =
        call (load_sym libatk "atk_action_set_description")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.Bool.VAL
          )
    end
    type 'a class_t = 'a AtkActionClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun doAction self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) doAction_ (self & i)
    fun getDescription self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr false) getDescription_ (self & i)
    fun getKeybinding self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr false) getKeybinding_ (self & i)
    fun getLocalizedName self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr false) getLocalizedName_ (self & i)
    fun getNActions self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNActions_ self
    fun getName self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr false) getName_ (self & i)
    fun setDescription self i desc =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         ---> FFI.Bool.fromVal
      )
        setDescription_
        (
          self
           & i
           & desc
        )
  end
