#!/bin/bash
set -e

BIND_DATA_DIR=${DATA_DIR}

  # populate default bind configuration if it does not exist
  if [ ! -d ${BIND_DATA_DIR}/etc ]; then
    mv /etc/bind ${BIND_DATA_DIR}/etc
  fi
  rm -rf /etc/bind
  ln -sf ${BIND_DATA_DIR}/etc /etc/bind

  if [ ! -d ${BIND_DATA_DIR}/lib ]; then
    mv /var/lib/bind ${BIND_DATA_DIR}/lib
  fi
  rm -rf /var/lib/bind
  ln -sf ${BIND_DATA_DIR}/lib /var/lib/bind
  
  if [ ! -d ${BIND_DATA_DIR}/log ]; then
    mkdir ${BIND_DATA_DIR}/log
  fi

  chmod -R 0775 ${BIND_DATA_DIR}
  chown -R ${BIND_USER}:${BIND_USER} ${BIND_DATA_DIR}

  echo "nameserver 127.0.0.1" > /etc/resolv.cong

echo "Starting named..."
exec /usr/sbin/named -u ${BIND_USER} -f
