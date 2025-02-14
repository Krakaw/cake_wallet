#!/bin/sh

. ./config.sh

cd $EXTERNAL_IOS_LIB_DIR
libtool -static -o libboost.a ./boost/*.a
libtool -static -o libhaven.a ./haven/*.a
libtool -static -o libmonero.a ./monero/*.a

CW_HAVEN_EXTERNAL_LIB=../../../../../cw_haven/ios/External/ios/lib
CW_HAVEN_EXTERNAL_INCLUDE=../../../../../cw_haven/ios/External/ios/include
CW_MONERO_EXTERNAL_LIB=../../../../../cw_monero/ios/External/ios/lib
CW_MONERO_EXTERNAL_INCLUDE=../../../../../cw_monero/ios/External/ios/include

mkdir -p $CW_HAVEN_EXTERNAL_INCLUDE
mkdir -p $CW_HAVEN_EXTERNAL_LIB
mkdir -p $CW_MONERO_EXTERNAL_LIB

ln ./libboost.a ${CW_HAVEN_EXTERNAL_LIB}/libboost.a
ln ./libcrypto.a ${CW_HAVEN_EXTERNAL_LIB}/libcrypto.a
ln ./libssl.a ${CW_HAVEN_EXTERNAL_LIB}/libssl.a
ln ./libsodium.a ${CW_HAVEN_EXTERNAL_LIB}/libsodium.a
cp ./libhaven.a $CW_HAVEN_EXTERNAL_LIB
cp ../include/haven/* $CW_HAVEN_EXTERNAL_INCLUDE

ln ./libboost.a ${CW_MONERO_EXTERNAL_LIB}/libboost.a
ln ./libcrypto.a ${CW_MONERO_EXTERNAL_LIB}/libcrypto.a
ln ./libssl.a ${CW_MONERO_EXTERNAL_LIB}/libssl.a
ln ./libsodium.a ${CW_MONERO_EXTERNAL_LIB}/libsodium.a
cp ./libmonero.a $CW_MONERO_EXTERNAL_LIB
cp ../include/monero/* $CW_MONERO_EXTERNAL_INCLUDE