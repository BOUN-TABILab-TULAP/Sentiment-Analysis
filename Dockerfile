FROM python:3.8

WORKDIR /app
COPY . .
RUN apt update 
RUN apt install python2.7 -y
RUN ln -sf /usr/bin/python2.7 /usr/local/bin/python
RUN apt install software-properties-common -y
RUN apt-get install -y locales locales-all
RUN python3 -m pip install -r requirements.txt
RUN python3 -m nltk.downloader stopwords
RUN python3 -m nltk.downloader wordnet
EXPOSE 5000
# CMD tail -f /dev/null
ENTRYPOINT [ "python3" ]
CMD [ "api.py","--language","turkish","--embedding_type","ensemble","--file_path","input/Sentiment_dataset_turk.csv"]
