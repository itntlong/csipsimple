
external_repos := silk opus zrtp4pj openssl
external_sources := $(foreach repos, $(external_repos),jni/$(repos)/sources)

to_patch := pjsip webrtc ffmpeg
to_patch_files := $(foreach proj, $(to_patch),jni/$(proj)/.patched_sources)

all : libraries
	# Dispatch to external projects
	@(./dispatch_shared_libs.sh)

libraries : ext-sources swig-glue webrtc-preprocess
	# Build main libraries using android ndk
	@(ndk-build -j6)

ffmpeg-lib : jni/ffmpeg/.patched_sources
	# Build ffmpeg using make
	@($(MAKE) $(MFLAGS) -C jni/ffmpeg)
	
webrtc-preprocess :
	@($(MAKE) $(MFLAGS) -C jni/webrtc preprocess)

ext-sources : $(external_sources) $(to_patch_files)
	# External sources fetched out from external repos/zip
	
jni/%/sources :
	@($(MAKE) $(MFLAGS) -C $(subst /sources,,$@) init)
	
## Patches against remote projects
jni/%/.patched_sources : 
	@($(MAKE) $(MFLAGS) -C $(subst /.patched_sources,,$@) patch)

swig-glue : 
	@($(MAKE) $(MFLAGS) -C jni/swig-glue)

clean :
	# NDK clean
	@(ndk-build clean)
	# Remote clean
	@($(MAKE) -C jni/ffmpeg clean)
	@($(MAKE) -C jni/swig-glue clean)
	@($(MAKE) -C jni/webrtc clean)

CodecPackLibs :
	@(ndk-build -j6 APP_MODULES="pj_g7221_codec pj_codec2_codec pj_g726_codec pj_opus_codec")
	@(./dispatch_shared_libs.sh)
	
VideoLibs : ffmpeg-lib
	@(ndk-build -j6 APP_MODULES="pj_video_android")
	@(./dispatch_shared_libs.sh)

ScreenSharingLibs :
	@(ndk-build -j6 APP_MODULES="pj_screen_capture_android")
	@(./dispatch_shared_libs.sh)


update : $(external_sources)
	# Quilt removal
	@$(foreach dir,$(to_patch),$(MAKE) $(MFLAGS) -C jni/$(dir) unpatch;)
	# Svn update
	@svn update --accept theirs-conflict
	# Remote sources update
	@$(foreach dir,$(external_repos),$(MAKE) $(MFLAGS) -C jni/$(dir) update;)
	# Update ffmpeg
	@($(MAKE) $(MFLAGS) -C jni/ffmpeg update)
	