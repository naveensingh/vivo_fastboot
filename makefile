# standalone Makefile for fastboot
SRCS+= protocol.c
SRCS+= engine.c
SRCS+= bootimg.c
SRCS+= fastboot.c
SRCS+= usb_linux.c
SRCS+= util_linux.c

VPATH+= ../../../external/zlib/src
SRCS+= adler32.c 
SRCS+= compress.c
SRCS+= crc32.c
SRCS+= deflate.c
SRCS+= gzclose.c 
SRCS+= gzlib.c 
SRCS+= gzread.c 
SRCS+= gzwrite.c 
SRCS+= infback.c 
SRCS+= inflate.c 
SRCS+= inftrees.c 
SRCS+= inffast.c 
SRCS+= trees.c 
SRCS+= uncompr.c 
SRCS+= zutil.c

VPATH+= ../../extras/ext4_utils
SRCS+= make_ext4fs.c 
SRCS+= ext4fixup.c 
SRCS+= ext4_utils.c 
SRCS+= allocate.c 
SRCS+= contents.c
SRCS+= extent.c 
SRCS+= indirect.c 
SRCS+= uuid.c 
SRCS+= sha1.c 
SRCS+= wipe.c 
SRCS+= crc16.c

VPATH+= ../../../external/libselinux/src
SRCS+= booleans.c 
SRCS+= canonicalize_context.c 
SRCS+= disable.c 
SRCS+= enabled.c 
SRCS+= fgetfilecon.c 
SRCS+= fsetfilecon.c 
SRCS+= getenforce.c 
SRCS+= getfilecon.c 
SRCS+= getpeercon.c 
SRCS+= lgetfilecon.c 
SRCS+= load_policy.c 
SRCS+= lsetfilecon.c 
SRCS+= policyvers.c 
SRCS+= procattr.c 
SRCS+= setenforce.c 
SRCS+= setfilecon.c 
SRCS+= context.c 
SRCS+= mapping.c 
SRCS+= stringrep.c 
SRCS+= compute_create.c 
SRCS+= compute_av.c 
SRCS+= avc.c 
SRCS+= avc_internal.c 
SRCS+= avc_sidtab.c 
SRCS+= get_initial_context.c 
SRCS+= checkAccess.c 
SRCS+= sestatus.c 
SRCS+= deny_unknown.c

SRCS+= callbacks.c 
SRCS+= check_context.c 
SRCS+= freecon.c 
SRCS+= init.c 
SRCS+= label.c 
SRCS+= label_file.c 
SRCS+= label_android_property.c

VPATH+= ../libsparse
SRCS+= backed_block.c 
SRCS+= output_file.c 
SRCS+= sparse.c 
SRCS+= sparse_crc32.c 
SRCS+= sparse_err.c 
SRCS+= sparse_read.c
 
VPATH+= ../libcutils
SRCS+= list.c
SRCS+= socket_inaddr_any_server.c
SRCS+= socket_local_client.c
SRCS+= socket_local_server.c
SRCS+= socket_loopback_client.c
SRCS+= socket_loopback_server.c
SRCS+= socket_network_client.c
SRCS+= load_file.c
 
VPATH+= ../libzipfile
SRCS+= centraldir.c
SRCS+= zipfile.c
 
CPPFLAGS+= -DHOST
CPPFLAGS+= -DADB_HOST=1
CPPFLAGS+= -DHAVE_FORKEXEC=1
CPPFLAGS+= -DHAVE_SYMLINKS
CPPFLAGS+= -DHAVE_TERMIO_H
CPPFLAGS+= -DHAVE_SYS_SOCKET_H
CPPFLAGS+= -D_GNU_SOURCE
CPPFLAGS+= -D_XOPEN_SOURCE
CPPFLAGS+= -I.
CPPFLAGS+= -I../include
CPPFLAGS+= -I../mkbootimg
CPPFLAGS+= -I../libsparse/include
CPPFLAGS+= -I../../extras/ext4_utils
CPPFLAGS+= -I../../../external/zlib
CPPFLAGS+= -I../../../external/openssl/include
CPPFLAGS+= -I../../../external/libselinux/include
 
CFLAGS+= -O2 -g -Wall -Wno-unused-parameter

TOOLCHAIN= /opt/poky/1.5/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-
CC= $(TOOLCHAIN)gcc
LD= $(TOOLCHAIN)gcc
 
OBJS= $(SRCS:.c=.o)
 
all: fastboot
 
fastboot: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)
 
clean:
	rm -rf $(OBJS)
