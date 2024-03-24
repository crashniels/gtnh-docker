# install java 17+
FROM eclipse-temurin:17

# packages
RUN apt update
RUN apt install unzip -y

# get gtnh
RUN wget https://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.5.0_Server_Java_17-21.zip
RUN unzip GT_New_Horizons_2.5.0_Server_Java_17-21.zip -d /gtnh
RUN rm GT_New_Horizons_2.5.0_Server_Java_17-21.zip

# get server utils 
RUN wget https://github.com/GTNewHorizons/ServerUtilities/releases/download/2.0.32/ServerUtilities-2.0.32.jar
RUN mv ServerUtilities-2.0.32.jar /gtnh/mods/

WORKDIR /gtnh

RUN sed -i 's;false;true;' eula.txt

EXPOSE 25565/tcp

CMD ["sh", "startserver-java9.sh"]