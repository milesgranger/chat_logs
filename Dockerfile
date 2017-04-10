# Base image Ubuntu 16.04 LTS
FROM ubuntu:16.04

# Upgrade system and install python
RUN apt update -y && apt upgrade -y
RUN apt install htop wget build-essential -y
RUN wget https://repo.continuum.io/miniconda/Miniconda2-4.2.12-Linux-x86_64.sh
RUN bash Miniconda2-4.2.12-Linux-x86_64.sh -bf -p /anaconda
ENV PATH $PATH:/anaconda/bin

# Install python packages
RUN echo "Installing conda packages.."
RUN conda config --add channels numba
RUN conda config --add channels conda-forge
RUN conda install numpy pandas scikit-learn bokeh -y
RUN conda install pytorch torchvision cuda80 -c soumith -y
RUN conda install jupyter notebook -y
RUN pip install --upgrade pip==9.0.1
RUN pip install keras tensorflow

# setup code and working directory
COPY . /workdir
WORKDIR /workdir

# Run the program
CMD ["jupyter",  "notebook", "--ip 0.0.0.0", "--no-browser"]