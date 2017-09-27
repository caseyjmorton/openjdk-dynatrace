#!/bin/bash

if [ "${DT_ENABLE}" = "TRUE" ]; then
	export DT_OPTARGS=Server=${DT_COLLECTOR},Name=${DT_AGENTNAME},ConsolelLogLevel=fine
	export JAVA_TOOL_OPTIONS=$JAVA_TOOL_OPTIONS\ -agentlib:dtagent=${DT_OPTARGS}
	export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/dynatrace-6.5/agent/lib64"
	echo "Dynatace Java Agent enabled"
else
	echo "Dynatrace Java Agent disabled"
fi

source ${START_CMD} "$@"