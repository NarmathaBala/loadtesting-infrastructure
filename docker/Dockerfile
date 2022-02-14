FROM justb4/jmeter:5.1.1

# https://jmeter-plugins.org/wiki/TestPlanCheckTool/
ENV PLAN_CHECK_PLUGIN_VERSION=2.4
RUN wget https://jmeter-plugins.org/files/packages/jpgc-plancheck-${PLAN_CHECK_PLUGIN_VERSION}.zip
RUN unzip -o jpgc-plancheck-${PLAN_CHECK_PLUGIN_VERSION}.zip -d ${JMETER_HOME}

# https://jmeter-plugins.org/wiki/UltimateThreadGroup/
ENV ULTIMATE_THREAD_GROUP_PLUGIN_VERSION=2.9
RUN wget https://jmeter-plugins.org/files/packages/jpgc-casutg-${ULTIMATE_THREAD_GROUP_PLUGIN_VERSION}.zip
RUN unzip -o jpgc-casutg-${ULTIMATE_THREAD_GROUP_PLUGIN_VERSION}.zip -d ${JMETER_HOME}

# https://jmeter-plugins.org/wiki/ResponseTimesOverTime/
ENV THREE_BASIC_GRAPHS_PLUGIN_VERSION=2.0
RUN wget https://jmeter-plugins.org/files/packages/jpgc-graphs-basic-${THREE_BASIC_GRAPHS_PLUGIN_VERSION}.zip
RUN unzip -o jpgc-graphs-basic-${THREE_BASIC_GRAPHS_PLUGIN_VERSION}.zip -d ${JMETER_HOME}

EXPOSE 1099

ENTRYPOINT ["/entrypoint.sh"]