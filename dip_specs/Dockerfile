FROM python:2.7

WORKDIR /app
COPY . .
RUN apt update 
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt install python3.7 -y
RUN apt-get install python3-pip -y
RUN apt-get install -y locales locales-all
RUN pip3 install -r requirements.txt
RUN python3 -m nltk.downloader stopwords
RUN python3 -m nltk.downloader wordnet
EXPOSE 5000
# CMD tail -f /dev/null
ENTRYPOINT [ "python3" ]
CMD [ "api.py","--language","turkish","--embedding_type","ensemble","--file_path","input/Sentiment_dataset_turk.csv"]