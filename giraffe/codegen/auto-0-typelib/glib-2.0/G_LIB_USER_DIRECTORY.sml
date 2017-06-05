signature G_LIB_USER_DIRECTORY =
  sig
    datatype enum =
      DIRECTORY_DESKTOP
    | DIRECTORY_DOCUMENTS
    | DIRECTORY_DOWNLOAD
    | DIRECTORY_MUSIC
    | DIRECTORY_PICTURES
    | DIRECTORY_PUBLIC_SHARE
    | DIRECTORY_TEMPLATES
    | DIRECTORY_VIDEOS
    | N_DIRECTORIES
    include
      ENUM
        where type t = enum
  end
