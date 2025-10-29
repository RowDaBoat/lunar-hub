FROM golang:1.24-alpine as builder

ARG checkout="master"
ARG git_url="https://github.com/coredns/coredns.git"
ENV install="/go/src/github.com/coredns/coredns"
ENV bond_plugin_name="example"
ENV bond_plugin_repo="github.com/RowDaBoat/bond-coredns"
ENV GOFLAGS="-buildvcs=false"

# Install dependencies and build the binaries.
RUN apk add --no-cache --update alpine-sdk \
    git \
    make
RUN git clone $git_url $install
WORKDIR $install
RUN git checkout $checkout
RUN echo "$bond_plugin_name:$bond_plugin_repo" >> plugin.cfg
RUN go get $bond_plugin_repo
RUN make gen
RUN make

FROM alpine as final

ENV install="/go/src/github.com/coredns/coredns"

COPY --from=builder $install/coredns .
COPY Corefile .
CMD ./coredns

