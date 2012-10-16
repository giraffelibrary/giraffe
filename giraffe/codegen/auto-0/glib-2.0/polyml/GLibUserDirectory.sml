structure GLibUserDirectory :>
  sig
    include G_LIB_USER_DIRECTORY
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
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
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            DIRECTORYDESKTOP => f 0
          | DIRECTORYDOCUMENTS => f 1
          | DIRECTORYDOWNLOAD => f 2
          | DIRECTORYMUSIC => f 3
          | DIRECTORYPICTURES => f 4
          | DIRECTORYPUBLICSHARE => f 5
          | DIRECTORYTEMPLATES => f 6
          | DIRECTORYVIDEOS => f 7
          | NDIRECTORIES => f 8
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => DIRECTORYDESKTOP
          | 1 => DIRECTORYDOCUMENTS
          | 2 => DIRECTORYDOWNLOAD
          | 3 => DIRECTORYMUSIC
          | 4 => DIRECTORYPICTURES
          | 5 => DIRECTORYPUBLICSHARE
          | 6 => DIRECTORYTEMPLATES
          | 7 => DIRECTORYVIDEOS
          | 8 => NDIRECTORIES
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    val null = DIRECTORYDESKTOP
  end
