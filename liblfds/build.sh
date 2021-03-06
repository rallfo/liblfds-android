# pase libarry type
if [ "$1" = "shared" ]; then
	LIBLFDS_LIB_TYPE=shared
elif [ "$1" = "static" ]; then
	LIBLFDS_LIB_TYPE=static
else
	# default: static
	LIBLFDS_LIB_TYPE=static
fi

# cleanup
rm -f ./jni/src
rm -f ./jni/inc
rm -rf ./obj

# make symbolic links
ln -fs ../../liblfds6.1.1/liblfds611/src ./jni/src
ln -fs ../../liblfds6.1.1/liblfds611/inc ./jni/inc

# build
NDK_PROJECT_PATH=./ ndk-build LIBLFDS_LIB_TYPE=$LIBLFDS_LIB_TYPE

