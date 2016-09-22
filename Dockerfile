FROM legato/spm:1.1.1

RUN apk add --no-cache docker && \
	cd /legato-spm && \
	cp legato-spm ant && \
	sed -e "s/com.swi.spm.headless.packagemanager/org.eclipse.ant.core.antRunner/;s|-data $WORKDIR/wks|-data /tmp/wks|" -i ant

ENTRYPOINT [ "/legato-spm/ant" ]
