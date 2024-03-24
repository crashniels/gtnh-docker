# install java 17+
FROM eclipse-temurin:17

# packages
RUN apt update
RUN apt install unzip -y

# get gtnh
RUN wget https://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.4.0_Server_Java_17-20.zip
RUN unzip GT_New_Horizons_2.4.0_Server_Java_17-20.zip -d /gtnh
RUN rm GT_New_Horizons_2.4.0_Server_Java_17-20.zip

WORKDIR /gtnh

# get server utils 
WORKDIR /mods
RUN wget https://github.com/GTNewHorizons/ServerUtilities/releases/download/2.0.32/ServerUtilities-2.0.32.jar
WORKDIR /gtnh

RUN sed -i 's;false;true;' eula.txt

EXPOSE 25565/tcp

# need to agree to eula and restart
CMD ["sh", "startserver-java9.sh"]