FROM cm2network/steamcmd


WORKDIR /home/steam
RUN sh steamcmd +login anonymous +quit


WORKDIR /home/steam
RUN mkdir -p "/home/steam/server_1"
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/server_1 +app_update 4020 +quit

RUN mkdir -p "/home/steam/content/css"
RUN /home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/content/css +app_update 232330 +quit

EXPOSE 6003/tcp
EXPOSE 7001/tcp
EXPOSE 27005/udp
EXPOSE 27010-27015/udp

ENTRYPOINT /home/steam/server_1/srcds_run -game garrysmod +maxplayers 12 +map gm_flatgrass

