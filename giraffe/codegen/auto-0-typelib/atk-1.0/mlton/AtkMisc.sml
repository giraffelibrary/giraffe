structure AtkMisc :>
  ATK_MISC
    where type 'a class = 'a AtkMiscClass.class =
  struct
    val getType_ = _import "atk_misc_get_type" : unit -> GObjectType.C.val_;
    val getInstance_ = _import "atk_misc_get_instance" : unit -> AtkMiscClass.C.notnull AtkMiscClass.C.p;
    val threadsEnter_ = _import "atk_misc_threads_enter" : AtkMiscClass.C.notnull AtkMiscClass.C.p -> unit;
    val threadsLeave_ = _import "atk_misc_threads_leave" : AtkMiscClass.C.notnull AtkMiscClass.C.p -> unit;
    type 'a class = 'a AtkMiscClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getInstance () = (I ---> AtkMiscClass.C.fromPtr false) getInstance_ ()
    fun threadsEnter self = (AtkMiscClass.C.withPtr ---> I) threadsEnter_ self
    fun threadsLeave self = (AtkMiscClass.C.withPtr ---> I) threadsLeave_ self
  end
