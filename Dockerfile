FROM ubuntu:24.04 AS build
RUN apt-get update \
    && apt-get install --yes --no-install-recommends gprolog \
    && find /var/lib/apt/lists -mindepth 1 -delete
WORKDIR /src
COPY src/stakeholder.pl src/stakeholder.pl
COPY tests/test_cli.sh tests/test_cli.sh
RUN mkdir -p /out \
    && gplc -o /out/stakeholder src/stakeholder.pl \
    && BIN=/out/stakeholder tests/test_cli.sh
FROM ubuntu:24.04
RUN groupadd --system stakeholder \
    && useradd --system --gid stakeholder --home-dir /nonexistent --shell /usr/sbin/nologin stakeholder
COPY --from=build /out/stakeholder /usr/local/bin/stakeholder
USER stakeholder
ENTRYPOINT ["/usr/local/bin/stakeholder"]
CMD ["--list-values"]
