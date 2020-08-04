structure AtkMisc :>
  ATK_MISC
    where type 'a class = 'a AtkMiscClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_misc_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getInstance_ = call (getSymbol "atk_misc_get_instance") (cVoid --> AtkMiscClass.PolyML.cPtr)
      val threadsEnter_ = call (getSymbol "atk_misc_threads_enter") (AtkMiscClass.PolyML.cPtr --> cVoid)
      val threadsLeave_ = call (getSymbol "atk_misc_threads_leave") (AtkMiscClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a AtkMiscClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getInstance () = (I ---> AtkMiscClass.FFI.fromPtr false) getInstance_ ()
    fun threadsEnter self = (AtkMiscClass.FFI.withPtr false ---> I) threadsEnter_ self
    fun threadsLeave self = (AtkMiscClass.FFI.withPtr false ---> I) threadsLeave_ self
  end
