# DataFlow 

## Hello World 

Google Cloud Shell 에서 Python 환경을 구성하여 DataFlow 작업을 진행할 수 있게 처리함. 
처리 방식은 아래의 샘플과 쉘의 명령에 따라서 진행하였음. 

```shell
pip3 install virtualenv
python3 -m virtualenv env
source env/bin/activate

pip3 install apache-beam[gcp] 
```


```shell
python3 -m \
    apache_beam.examples.wordcount \
    --region us-central1 --input \
    gs://dataflow-samples/shakespeare/kinglear.txt \
    --output \
    gs://dataflow-apache-quickstart_warm-abacus-388903/results/output \
    --runner DataflowRunner \
    --project warm-abacus-388903 \
    --temp_location \
    gs://dataflow-apache-quickstart_warm-abacus-388903/temp/
```

위의 명령어로 실행했던 부분에 대해서 아래에 다양한 예시를 설명하고 있음 

- [전체 튜토리얼(https://console.cloud.google.com/welcome?walkthrough_id=dataflow--quickstart-beam--quickstart-beam-python&hl=ko&_ga=2.37119072.1788011584.1687583742-1678982310.1680693079&_gac=1.3287940.1686998177.EAIaIQobChMI4MvGv__J_wIV0UlgCh2tRgU_EAAYASAAEgL7fvD_BwE&project=warm-abacus-388903)]

- [https://cloud.google.com/dataflow/docs/concepts/beam-programming-model?hl=ko](https://cloud.google.com/dataflow/docs/concepts/beam-programming-model?hl=ko)
- [https://cloud.google.com/storage/docs/gsutil?hl=ko](https://cloud.google.com/storage/docs/gsutil?hl=ko)
- [https://github.com/apache/beam/blob/master/sdks/python/apache_beam/examples/wordcount.py](https://github.com/apache/beam/blob/master/sdks/python/apache_beam/examples/wordcount.py)

## [All Features](https://cloud.google.com/dataflow?hl=ko#all-features)

## Container Environment에 대한 이해 

```dockerfile
FROM apache/beam_python3.8_sdk:2.25.0 

ENV MY_FILE_NAME=my_file.txt 

COPY path/to/myfile/$MY_FILE_NAME ./
```

```shell
gcloud builds submit --tag $IMAGE_URI 
```

```shell
docker build -f Dockerfile -t $IMAGE_URI ./ 
docker push $IMAGE_URI
```

- Launch Dataflow Job 

```shell
python my-pipeline.py \ 
       --input=INPUT_FILE \
       --project=PROJECT_ID \
       --region=REGION \
       --temp_location=TEMP_LOCATION \ 
       --runner=DataflowRunner \ 
       --worker_harness_container_image=$IMAGE_URI 
```

## Cross-language transforms 

```python 
from apache_beam.io.kafka import ReadFromKafka 

with beam.Pipeline(options=<Your Beam PipelineOptions object> as p: 
    p
    | ReadFromKafka(
        consumer_config={'bootstrap.servers' : '<kafka bootstrap servers list>'}, 
        topics=[<List of Kafka topic>])
```

# DataFlow 

## Dataflow Shuffle Service : Batch 

## Dataflow Streaming Engine 

## Flexible Resource Scheduling ( FlexRS )

## Dataflow SQL로 스트리밍 데이터 조인 

> [https://cloud.google.com/dataflow/docs/tutorials/join-streaming-data-with-sql?hl=ko](https://cloud.google.com/dataflow/docs/tutorials/join-streaming-data-with-sql?hl=ko)

### API 사용 설정 

```
dataflow
compute_component
logging
storage_component
storage_api
bigquery
pubsub
cloudresourcemanager
datacatalog.googleapis.com
```

각 API에 대한 활성화 여부는 아래의 명령어를 통해서 확인 가능하다. 

```shell 
$ gcloud services list --enabled
```

### Service Account 설정 

실제 사용할 Service Account를 생성하여 지정합니다. 

### Pub/Sub 주제 및 게시자 스크립트 만들기 


## Pub/Sub 및 Dataflow를 사용한 스트림 처리 


## 클라우드 아키텍처 센터에서 제공하는 [예측]과 관련된 링크 

- [https://cloud.google.com/architecture/reference-patterns/overview?hl=ko#predictive_forecasting](https://cloud.google.com/architecture/reference-patterns/overview?hl=ko#predictive_forecasting)