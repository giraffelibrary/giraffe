signature G_LIB_USER_DIRECTORY =
  sig
    datatype t =
      DIRECTORYDESKTOP
    | DIRECTORYDOCUMENTS
    | DIRECTORYDOWNLOAD
    | DIRECTORYMUSIC
    | DIRECTORYPICTURES
    | DIRECTORYPUBLICSHARE
    | DIRECTORYTEMPLATES
    | DIRECTORYVIDEOS
    | NDIRECTORIES
    val null : t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
