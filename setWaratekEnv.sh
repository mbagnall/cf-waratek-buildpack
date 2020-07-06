#!/bin/sh

# Add JAVA to PATH
echo "[INFO] Including Java on the PATH"
export PATH=$PATH:/home/vcap/app/.java/bin

# Waratek Secure location
export WARATEK_ROOT=/home/vcap/app/waratek-secure

# Extend JAVA_OPTS to use Waratek Secure
echo "[INFO] Extend JAVA_OPTS to use Waratek Secure"
#export JAVA_OPTS="${JAVA_OPTS} -javaagent:${WARATEK_ROOT}/agent/waratek.jar -Dcom.waratek.WaratekProperties=${WARATEK_ROOT}/conf_1/waratek.properties"
export JAVA_OPTS="-javaagent:${WARATEK_ROOT}/agent/waratek.jar -Dcom.waratek.WaratekProperties=${WARATEK_ROOT}/conf_1/waratek.properties ${JAVA_OPTS}"

# Run application with Waratek
echo "[INFO] Start Application with Waratek Secure"
echo "[INFO] Application start command is: ${APP_LAUNCH_CMD}"
echo "[INFO] JAVA_OPTS to be used are: ${JAVA_OPTS}"
${APP_LAUNCH_CMD}
#export JAVA_OPTS="${JAVA_OPTS} -javaagent:${WARATEK_ROOT}/agent/waratek.jar -Dcom.waratek.WaratekProperties=${WARATEK_ROOT}/conf_1/waratek.properties" && ${APP_LAUNCH_CMD}