# Generating Word and Document Embeddings for Sentiment Analysis
This repo contains the source code of the paper --

[Generating Word and Document Embeddings for Sentiment Analysis](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwiK8bSAotDsAhXyh4sKHSrZB-EQFjABegQIARAC&url=https%3A%2F%2Fwww.cmpe.boun.edu.tr%2F~gungort%2Fpapers%2FGenerating%2520Word%2520and%2520Document%2520Embeddings%2520for%2520Sentiment%2520Analysis.pdf&usg=AOvVaw3KaXHe7J0caSq1QdTsUcVU).
Cem Rıfkı Aydın, Tunga Güngör, Ali Erkan. CICLing 2019

This approach attempts to model word and document embeddings for the binary sentiment classification task in Turkish and English. This study can be adapted to other languages with minor changes.

## How to run using Docker
1. Clone the repo
```bash
git clone https://github.com/BOUN-TABILab-TULAP/Sentiment-Analysis.git
```
2. Launch a terminal in the root directory of the repo and build the Docker image where
- `-t` is the tag for the Docker image. You can provide any name you want
- `.` is the relative path to the Dockerfile 
```bash
docker build -t sentiment-analysis .
```
3. Run the Docker image where
- `-d` indicates "detach", let the container run in the background
- `-p 5000:5000` indicates mapping port 5000 of the container to the port 5000 of the host.
```bash
docker run -d -p 5000:5000 sentiment-analysis
```
4. Send a POST request
- via curl
    ```bash
    curl -X POST http://localhost:5000/evaluate 
   -H 'Content-Type: application/json' 
   -d '{"textarea":"Yagmur yagarken lutfen kosturmayalim"}'

   > {'text': 'Negative'}
    ```
- via Python's requests library
    ```python
    import requests
    res = requests.post('http://localhost:5000/evaluate', json={'textarea':'Yagmur yagarken lutfen kosturmayalim'})
    print(res.json())

    > {'text': 'Negative'}
    ```

## Citation
If you find this code useful, please cite the following in your work:
```
@InProceedings{sent-emb:19,
  author = 	"Aydin, Cem Rifki
		and Gungor, Tunga
		and Erkan, Ali",
  title = 	"Generating Word and Document Embeddings for Sentiment Analysis",
  booktitle = 	"20th International Conference on Intelligent Text Processing and Computational Linguistics (CICLing 2019), Ed. A.Gelbukh",
  year = 	"2019",
  month =       "April",
  location = 	"La Rochelle, France"
}
```
## Credits
Codes were written by Cem Rıfkı Aydın
