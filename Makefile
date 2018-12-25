export ROOT_DIR=${PWD}

include config.mk

all:OPENSSL SRTP MP4V2 MEDIASERVER_STATIC
	echo $(ROOT_DIR)

OPENSSL:
	cd ${OPENSSL_DIR} &&  export KERNEL_BITS=64 && ./config && make 
	cd $(ROOT_DIR)

SRTP:
	cd ${LIBSRTP_DIR} && ./configure && make  
	cd $(ROOT_DIR) 

MP4V2:
	cd ${LIBMP4_DIR} && autoreconf -i && ./configure && make 
	cd $(ROOT_DIR)

MEDIASERVER_STATIC:
	cp config.mk  ./media-server/ && make -C media-server libmediaserver.a 
	echo ${ROOT_DIR}

ECHO:
	echo $(ROOT_DIR)
	echo $(OPENSSL_DIR)
	
