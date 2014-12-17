structure GtkAboutDialog :>
  GTK_ABOUT_DIALOG
    where type 'a class_t = 'a GtkAboutDialogClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type license_t = GtkLicense.t =
  struct
    val getType_ = _import "gtk_about_dialog_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_about_dialog_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getComments_ = _import "gtk_about_dialog_get_comments" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getCopyright_ = _import "gtk_about_dialog_get_copyright" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getLicense_ = _import "gtk_about_dialog_get_license" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getLicenseType_ = _import "gtk_about_dialog_get_license_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkLicense.C.val_;
    val getLogo_ = _import "gtk_about_dialog_get_logo" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLogoIconName_ = _import "gtk_about_dialog_get_logo_icon_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getProgramName_ = _import "gtk_about_dialog_get_program_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getTranslatorCredits_ = _import "gtk_about_dialog_get_translator_credits" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getVersion_ = _import "gtk_about_dialog_get_version" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getWebsite_ = _import "gtk_about_dialog_get_website" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getWebsiteLabel_ = _import "gtk_about_dialog_get_website_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getWrapLicense_ = _import "gtk_about_dialog_get_wrap_license" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setComments_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_comments" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCopyright_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_copyright" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLicense_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_license" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLicenseType_ = fn x1 & x2 => (_import "gtk_about_dialog_set_license_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkLicense.C.val_ -> unit;) (x1, x2)
    val setLogo_ = fn x1 & x2 => (_import "gtk_about_dialog_set_logo" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setLogoIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_logo_icon_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setProgramName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_program_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTranslatorCredits_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_translator_credits" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVersion_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_version" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWebsite_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_website" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWebsiteLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_about_dialog_set_website_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWrapLicense_ = fn x1 & x2 => (_import "gtk_about_dialog_set_wrap_license" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkAboutDialogClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type license_t = GtkLicense.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkAboutDialogClass.C.fromPtr false) new_ ()
    fun getComments self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getComments_ self
    fun getCopyright self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getCopyright_ self
    fun getLicense self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getLicense_ self
    fun getLicenseType self = (GObjectObjectClass.C.withPtr ---> GtkLicense.C.fromVal) getLicenseType_ self
    fun getLogo self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getLogo_ self
    fun getLogoIconName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getLogoIconName_ self
    fun getProgramName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getProgramName_ self
    fun getTranslatorCredits self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTranslatorCredits_ self
    fun getVersion self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getVersion_ self
    fun getWebsite self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getWebsite_ self
    fun getWebsiteLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getWebsiteLabel_ self
    fun getWrapLicense self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getWrapLicense_ self
    fun setComments self comments = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setComments_ (self & comments)
    fun setCopyright self copyright = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setCopyright_ (self & copyright)
    fun setLicense self license = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setLicense_ (self & license)
    fun setLicenseType self licenseType = (GObjectObjectClass.C.withPtr &&&> GtkLicense.C.withVal ---> I) setLicenseType_ (self & licenseType)
    fun setLogo self logo = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setLogo_ (self & logo)
    fun setLogoIconName self iconName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setLogoIconName_ (self & iconName)
    fun setProgramName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setProgramName_ (self & name)
    fun setTranslatorCredits self translatorCredits = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setTranslatorCredits_ (self & translatorCredits)
    fun setVersion self version = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setVersion_ (self & version)
    fun setWebsite self website = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setWebsite_ (self & website)
    fun setWebsiteLabel self websiteLabel = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setWebsiteLabel_ (self & websiteLabel)
    fun setWrapLicense self wrapLicense = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setWrapLicense_ (self & wrapLicense)
    local
      open ClosureMarshal Signal
    in
      fun activateLinkSig f = signal "activate-link" (get 0w1 string ---> ret boolean) f
    end
    local
      open Property
    in
      val commentsProp =
        {
          get = fn x => get "comments" stringOpt x,
          set = fn x => set "comments" stringOpt x
        }
      val copyrightProp =
        {
          get = fn x => get "copyright" stringOpt x,
          set = fn x => set "copyright" stringOpt x
        }
      val licenseProp =
        {
          get = fn x => get "license" stringOpt x,
          set = fn x => set "license" stringOpt x
        }
      val licenseTypeProp =
        {
          get = fn x => get "license-type" GtkLicense.t x,
          set = fn x => set "license-type" GtkLicense.t x
        }
      val logoProp =
        {
          get = fn x => get "logo" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "logo" GdkPixbufPixbufClass.tOpt x
        }
      val logoIconNameProp =
        {
          get = fn x => get "logo-icon-name" stringOpt x,
          set = fn x => set "logo-icon-name" stringOpt x
        }
      val programNameProp =
        {
          get = fn x => get "program-name" stringOpt x,
          set = fn x => set "program-name" stringOpt x
        }
      val translatorCreditsProp =
        {
          get = fn x => get "translator-credits" stringOpt x,
          set = fn x => set "translator-credits" stringOpt x
        }
      val versionProp =
        {
          get = fn x => get "version" stringOpt x,
          set = fn x => set "version" stringOpt x
        }
      val websiteProp =
        {
          get = fn x => get "website" stringOpt x,
          set = fn x => set "website" stringOpt x
        }
      val websiteLabelProp =
        {
          get = fn x => get "website-label" stringOpt x,
          set = fn x => set "website-label" stringOpt x
        }
      val wrapLicenseProp =
        {
          get = fn x => get "wrap-license" boolean x,
          set = fn x => set "wrap-license" boolean x
        }
    end
  end
