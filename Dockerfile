FROM swids/maven-test:debian

ARG DS_VERSION=5.0
ARG DS_FETCH_URL=http://updatesite.sierrawireless.com/developerStudio4/product

RUN mkdir -p -m 777 /ds \
 && wget ${DS_FETCH_URL}/devstudio-${DS_VERSION}-linux64.zip -O /ds/ds.zip \
 && cd /ds \
 && unzip -q ds.zip \
 && rm ds.zip \
 && cp legato-spm ant \
 && sed -e "s/com.swi.spm.headless.packagemanager/org.eclipse.ant.core.antRunner/;s|-data $WORKDIR/wks|-data /tmp/wks|" -i ant

ENTRYPOINT [ "/ds/ant" ]
