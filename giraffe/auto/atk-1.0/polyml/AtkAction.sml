structure AtkAction :>
  ATK_ACTION
    where type 'a class_t = 'a AtkActionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_action_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val doAction_ = call (load_sym libatk "atk_action_do_action") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val getDescription_ = call (load_sym libatk "atk_action_get_description") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val getKeybinding_ = call (load_sym libatk "atk_action_get_keybinding") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val getLocalizedName_ = call (load_sym libatk "atk_action_get_localized_name") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val getNActions_ = call (load_sym libatk "atk_action_get_n_actions") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getName_ = call (load_sym libatk "atk_action_get_name") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val setDescription_ =
        call (load_sym libatk "atk_action_set_description")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a AtkActionClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun doAction self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) doAction_ (self & i)
    fun getDescription self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getDescription_ (self & i)
    fun getKeybinding self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getKeybinding_ (self & i)
    fun getLocalizedName self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getLocalizedName_ (self & i)
    fun getNActions self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNActions_ self
    fun getName self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getName_ (self & i)
    fun setDescription self i desc =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         ---> FFI.Bool.C.fromVal
      )
        setDescription_
        (
          self
           & i
           & desc
        )
  end
