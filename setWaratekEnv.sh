#!/bin/sh

# Add JAVA to PATH
echo "[INFO] Including Java on the PATH"
export PATH=$PATH:/home/vcap/app/.java/bin

# Waratek Secure location
export WARATEK_ROOT=/home/vcap/app/waratek-secure

# Extend JAVA_OPTS to use Waratek Secure
echo "[INFO] Extend JAVA_OPTS to use Waratek Secure"
export JAVA_OPTS="${JAVA_OPTS} -javaagent:${WARATEK_ROOT}/agent/waratek.jar -Dcom.waratek.WaratekProperties=${WARATEK_ROOT}/conf_1/waratek.properties"

# Run application with Waratek
echo "[INFO] Start Application with Waratek Secure"
echo "[] Application start command is: ${APP_LAUNCH_CMD}"
${APP_LAUNCH_CMD}