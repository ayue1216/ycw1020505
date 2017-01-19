FROM ubuntu:14.04
MAINTAINER 1020505

RUN apt-get update
RUN apt-get install wget bzip2 unzip tar 
RUN y
RUN apt-get install build-essential python-dev
RUN y
RUN cd opt
RUN wget https://sourceforge.net/projects/math-atlas/files
/Stable/3.10.3/atlas3.10.3.tar.bz2
RUN wget https://github.com/cvxopt/cvxopt/archive/master.z
ip

RUN unzip master.zip
RUN mv cvxopt-master cvxopt
RUN bunzip2 atlas3.10.3.tar.bz2
RUN tar xvf atlas3.10.3.tar
RUN mv ATLAS ATLAS3.10.3
RUN cd ATLAS3.10.3
RUN mkdir Linux_C2D64SSE3
RUN cd Linux_C2D64SSE3
RUN cd /opt
RUN wget http://www.netlib.org/lapack/lapack-3.4.1.tgz
RUN cd ATLAS3.10.3/Linux_C2D64SSE3
RUN apt-get install gfortran cmake
RUN y
RUN ../configure -b 64 -D c -DPentiumCPS=3900 --prefix=/us
r/lib/atlas     --with-netlib-lapack-tarfile=/opt/lapack-3.4.1.tgz
RUN make build
RUN make ptcheck
RUN make time
RUN make install
RUN cd /usr/lib
RUN cp -r atlas /opt
RUN cd /usr/lib/atlas
RUN mv lib /usr
RUN cd /opt/cvxopt
RUN wget http://faculty.cse.tamu.edu/davis/SuiteSparse/Sui
teSparse-4.5.3.tar.gz
RUN tar -xf SuiteSparse-4.5.3.tar.gz
RUN export CVXOPT_SUITESPARSE_SRC_DIR=$(pwd)/SuiteSpars
RUN python setup.py install --user





CMD [ "nginx", "-g", "daemon off;" ]

EXPOSE 80
