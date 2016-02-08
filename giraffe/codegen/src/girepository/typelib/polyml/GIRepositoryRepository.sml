structure GIRepositoryRepository :>
  G_I_REPOSITORY_REPOSITORY
    where type 'a class_t = 'a GIRepositoryRepositoryClass.t
    where type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    where type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    where type typelibtype_t = GIRepositoryTypelibType.t =
  struct
    local
      open PolyMLFFI
    in
      val getDefault_ =
        call
          (load_sym libgirepository "g_irepository_get_default")
          (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)

      val prependSearchPath_ =
        call
          (load_sym libgirepository "g_irepository_prepend_search_path")
          (Utf8.PolyML.INPTR --> FFI.PolyML.VOID)

      val loadTypelib_ =
        call
          (load_sym libgirepository "g_irepository_load_typelib")
          (GObjectObjectClass.PolyML.PTR
            &&> GIRepositoryTypelibType.PolyML.PTR
            &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
            &&> GLibErrorRecord.PolyML.OUTOPTREF
            --> Utf8.PolyML.RETPTR)

      val require_ =
        call
          (load_sym libgirepository "g_irepository_require")
          (GObjectObjectClass.PolyML.PTR
            &&> Utf8.PolyML.INPTR
            &&> Utf8.PolyML.INPTR
            &&> GIRepositoryRepositoryLoadFlags.PolyML.VAL
            &&> GLibErrorRecord.PolyML.OUTOPTREF
            --> GIRepositoryTypelibType.PolyML.PTR)

      val getDependencies_ =
        call
          (load_sym libgirepository "g_irepository_get_dependencies")
          (GObjectObjectClass.PolyML.PTR
            &&> Utf8.PolyML.INPTR
            --> Utf8Vector.PolyML.RETOPTPTR)

      val getNInfos_ =
        call
          (load_sym libgirepository "g_irepository_get_n_infos")
          (GObjectObjectClass.PolyML.PTR
            &&> Utf8.PolyML.INPTR
            --> FFI.Int32.PolyML.VAL)

      val getInfo_ =
        call
          (load_sym libgirepository "g_irepository_get_info")
          (GObjectObjectClass.PolyML.PTR
            &&> Utf8.PolyML.INPTR
            &&> FFI.Int32.PolyML.VAL
            --> GIRepositoryBaseInfoClass.PolyML.PTR)

      val getSharedLibrary_ =
        call
          (load_sym libgirepository "g_irepository_get_shared_library")
          (GObjectObjectClass.PolyML.PTR
            &&> Utf8.PolyML.INPTR
            --> Utf8.PolyML.RETOPTPTR)

      val getVersion_ =
        call
          (load_sym libgirepository "g_irepository_get_version")
          (GObjectObjectClass.PolyML.PTR
            &&> Utf8.PolyML.INPTR
            --> Utf8.PolyML.RETOPTPTR)

      val getCPrefix_ =
        call
          (load_sym libgirepository "g_irepository_get_c_prefix")
          (GObjectObjectClass.PolyML.PTR
            &&> Utf8.PolyML.INPTR
            --> Utf8.PolyML.RETPTR)
    end


    type 'a class_t = 'a GIRepositoryRepositoryClass.t
    type 'a baseinfoclass_t = 'a GIRepositoryBaseInfoClass.t
    type loadflags_t = GIRepositoryRepositoryLoadFlags.flags
    type typelibtype_t = GIRepositoryTypelibType.t


    (* The interface specified by G_I_REPOSITORY_REPOSITORY is a variation on
     * GIRepository to allow multiple versions of a namespace to be loaded in
     * the repository.  The GIRepository C library does not support multiple
     * versions so G_I_REPOSITORY_REPOSITORY is implemented by wrapping the
     * C functions 'get*' in a check that the name to version map specified
     * by the `typelibvers_t` argument is the same as the version already
     * loaded in the repository.
     *
     * The bindings to the C functions that are subsequently wrapped have the
     * suffix '1'. *)

    fun getDefault () =
      (I ---> GIRepositoryRepositoryClass.C.fromPtr false) getDefault_ ()

    fun loadTypelib repository typelib flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GIRepositoryTypelibType.C.withPtr
         &&&> GIRepositoryRepositoryLoadFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> Utf8.C.fromPtr false
      )
        loadTypelib_
        (repository & typelib & flags & [])

    fun prependSearchPath directory =
      (Utf8.C.withConstPtr ---> I) prependSearchPath_ directory

    fun require1 repository namespace_ version flags =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> Utf8.C.withConstPtr
         &&&> GIRepositoryRepositoryLoadFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GIRepositoryTypelibType.C.fromPtr false
      )
        require_
        (repository & namespace_ & version & flags & [])

    fun getDependencies1 repository namespace_ =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         ---> Utf8Vector.C.fromOptPtr true
      )
        getDependencies_
        (repository & namespace_)

    fun getNInfos1 repository namespace_ =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         ---> FFI.Int32.C.fromVal
      )
        getNInfos_
        (repository & namespace_)

    fun getInfo1 repository namespace_ index =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         ---> GIRepositoryBaseInfoClass.C.fromPtr true
      )
        getInfo_
        (repository & namespace_ & index)

    fun getSharedLibrary1 repository namespace =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         ---> Utf8.C.fromOptPtr false
      )
        getSharedLibrary_
        (repository & namespace)

    fun getVersion1 repository namespace =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         ---> Utf8.C.fromOptPtr false
      )
        getVersion_
        (repository & namespace)

    fun getCPrefix1 repository namespace_ =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstPtr
         ---> Utf8.C.fromOptPtr false
      )
        getCPrefix_
        (repository & namespace_)


    (* `typelibvers_t` is a map from names to versions. *)

    type typelibvers_t = string ListDict.t


    (* Support for extending `typelibvers_t` values. *)

    fun errMsgVerExists name ver =
      String.concat [
        "namespace '", name, "' version '", ver, "' already present"
      ]

    fun errMsgVerConflict name ver1 ver2 =
      String.concat [
        "namespace '", name, "' version '", ver1,
        "' conflicts with version '", ver2, "' that is already present"
      ]

    fun checkVer name (ver1, ver2) =
      if ver1 = ver2
      then raise Fail (errMsgVerExists name ver2)
      else raise Fail (errMsgVerConflict name ver1 ver2)

    fun insertTypelibVer ((name, ver), vers) =
      ListDict.insert I (checkVer name) ((name, ver), vers)

    fun extendTypelibVers extraVers vers = foldl insertTypelibVer vers extraVers


    (* Checking `typelibvers_t` values is performed by `getVersion`. *)

    fun errMsgNamespaceNotInVers name  =
      String.concat [
        "typelib versions do not include namespace '",
        name,
        "'"
      ]

    fun errMsgNamesaceNotInRepo name =
      String.concat ["namespace '", name, "' not loaded"]

    fun errMsgVerMismatch name version versionLoaded  =
      String.concat [
        "typelib version for namespace '", name,
        "' is version '", version,
        "' but repository has version '", versionLoaded,
        "' loaded"
      ]

    fun getVersion repository versions name =
      case ListDict.lookup versions name of
        SOME version => (
          case getVersion1 repository name of
            SOME versionLoaded =>
              if version = versionLoaded
              then version
              else raise Fail (errMsgVerMismatch name version versionLoaded)
          | NONE               => raise Fail (errMsgNamesaceNotInRepo name)
        )
      | NONE         => raise Fail (errMsgNamespaceNotInVers name)


    (* Support for decoding a dependency of the form <name>-<version>. *)

    fun errMsgDependencyFormat dep  =
      String.concat [
        "dependecy \"",
        String.toString dep,
        "\" does not have the form <name>-<version>"
      ]

    fun parseDependency dep =
      case String.fields (fn c => c = #"-") dep of
        [name, version] => (name, version)
      | _               => raise Fail (errMsgDependencyFormat dep)


    (* Wrap GIRepository functions to support `typelibvers_t` *)

    fun require repository namespace_ version flags =
      let
        val typelib = require1 repository namespace_ version flags
        val dependencies =
          case getDependencies1 repository namespace_ of
            NONE      => ListDict.empty
          | SOME deps => extendTypelibVers (map parseDependency deps) ListDict.empty

        val versions =
          ListDict.insert I
            (fn _ => raise Fail "typelib dependency contains itself")
            ((namespace_, version), dependencies)
      in
        (typelib, versions)
      end

    fun getDependencies repository versions namespace_ = (
      ignore (getVersion repository versions namespace_);
      getDependencies1 repository namespace_
    )

    fun getNInfos repository versions namespace_ = (
      ignore (getVersion repository versions namespace_);
      getNInfos1 repository namespace_
    )

    fun getInfo repository versions namespace_ index = (
      ignore (getVersion repository versions namespace_);
      getInfo1 repository namespace_ index
    )

    fun getSharedLibrary repository versions namespace_ = (
      ignore (getVersion repository versions namespace_);
      getSharedLibrary1 repository namespace_
    )

    fun getCPrefix repository versions namespace_ = (
      ignore (getVersion repository versions namespace_);
      getCPrefix1 repository namespace_
    )

  end
