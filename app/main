#!/usr/bin/bash

vmimDuration() {
	dateToS() { date --date="$@" +%s ; }
	dateDiff() { echo $(( $(dateToS $1) - $(dateToS $2) )) ; }
	dateDiff $(oc get vmim $1 -o jsonpath="{.status.migrationState.endTimestamp}{' '}{.status.migrationState.startTimestamp}") ; 
}

watch_vmims() { oc get vmim --watch-only -o jsonpath="{'NAMESPACE='}{.metadata.namespace}{' NAME='}{.metadata.name}{' PHASE='}{.status.phase}{' VMI_NAME='}{.spec.vmiName}{'\n'}" ; }

vmim_exists() { oc get vmim $NAME > /dev/null 2>&1 ; }

handle_phase() {
	case "$PHASE" in
		Running)
			echo virtctl pause vmi $VMI_NAME
			;;
		Succeeded)
		       	virtctl unpause vmi $VMI_NAME
			vmimDuration $NAME
			oc delete vmim $NAME
			;;
	esac
}

handle_vmim() {
	eval $@
	vmim_exists || return
	echo $NAME $PHASE
	handle_phase
}

watch_vmims | while read VARS ; do { handle_vmim $VARS ; echo --- ; } ; done 
