FROM openjdk:11-jdk-slim

ENV USERNAME ishtar
ENV GHIDRA_DL https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.4_build/ghidra_10.1.4_PUBLIC_20220519.zip
ENV GHIDRA_DIR ghidra_10.1.4_PUBLIC

RUN apt-get update
RUN apt-get install -y wget unzip dnsutils --no-install-recommends
RUN wget --quiet --no-check-certificate -O /tmp/ghidra.zip ${GHIDRA_DL}
RUN unzip /tmp/ghidra.zip \
    && mv ${GHIDRA_DIR} /ghidra \
    && chmod +x /ghidra/ghidraRun

EXPOSE 13100
EXPOSE 13101
EXPOSE 13102

RUN useradd -ms /bin/bash user -p $(openssl passwd -1 "user")
RUN chown -Rv user:user /ghidra

USER user

RUN mkdir -p /ghidra/repositories/~admin

COPY entrypoint.sh /ghidra/entrypoint.sh
ENTRYPOINT ["/ghidra/entrypoint.sh"]