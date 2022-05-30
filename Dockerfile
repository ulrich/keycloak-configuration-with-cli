FROM jboss/keycloak:15.0.2

RUN mkdir /opt/jboss/startup-scripts

ADD --chown=jboss:root cli/update_assets_cache.cli /opt/jboss/startup-scripts/

CMD ["-c", "standalone.xml"]