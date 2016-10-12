FROM openjdk:8-jdk-alpine

ENV DS_VERSION 4.1.1

RUN apk add --no-cache wget docker && \
	mkdir -p -m 777 /ds && \
	wget http://updatesite.sierrawireless.com/developerStudio4/product/devstudio-${DS_VERSION}-linux64.zip -O /ds/ds.zip && \
	cd /ds && \
	unzip -q ds.zip && \
	rm ds.zip && \
	cp legato-spm ant && \
	sed -e "s/com.swi.spm.headless.packagemanager/org.eclipse.ant.core.antRunner/;s|-data $WORKDIR/wks|-data /tmp/wks|" -i ant

ENTRYPOINT [ "/ds/ant" ]
